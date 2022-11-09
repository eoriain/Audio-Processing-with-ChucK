// Eoghan Ó Riain
// 111319036

// Private class created for the Rhythm sound effect
// Class contains data 
private class Rhythm
{
    //chord levels presented in an array to be chucked to the chord array
    [0,3,7,3] @=> int notes[];
    //audio to commence from the first position in the array
    0 => int position;
}
// Class represention identified as r
Rhythm r;

// the beat of the audio is set to 0.6s per beat
1.193::second => dur beat;
// offset of the tone specified as 24. 
24 => int offsetValue;

//function developed so it can be called in a spork
fun void StartRhythm(int note, int position, dur duration)
{
    // Sine wave oscillator ugen set to pass through a saw wave oscillator, then a resonant low pass filter
    // the to an ADSR (Attack, Decay, Sustain, Release) envelope class filter before being chucked to the left dac.
    SinOsc first_osc => SawOsc second_osc => LPF lpf => ADSR env => dac.left;
    //A delay is applied to the right dac.
    env => Delay delay => dac.right;
    
    //Parameters of the delay is specified.
    duration => delay.max;
    duration/15 => delay.delay;
    delay => delay;
    0.7 => delay.gain;
    
    //Specific values are applied to the attributes of the ugen 
    1 => first_osc.gain;
    4 => first_osc.freq;
    2 => second_osc.sync;
    0.1 => second_osc.gain;
    300 => lpf.freq;
    
    //MIDI-to-Frequency function used to compile the variable values and converting them a frequency before chucking it to the ugen frequency.
    Std.mtof(note+offsetValue+position) => second_osc.freq;
    
    //intensity of the tone in the delay specified
    (20::ms, duration*2, 0, 20::ms) => env.set;
    
    //True value issued to activate the delay for the duration specified.
    1 => env.keyOn;
    duration => now;
}
//Infinite loop created
while(true)
{
    //for loop added to cycle through the array created for the chords in the audio piece.
    for(0 => int i; i < r.notes.cap(); i++)
    {
        //Sporking the audio function with the associated iteeration value.
        spork ~ StartRhythm(r.notes[i], r.position, beat);
    }
    //duration of the beat specified.
    beat => now;
}