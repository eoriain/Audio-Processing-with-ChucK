// Eoghan Ó Riain
// 111319036

// Private class created for the Beat sound effect
// Class contains data 
private class Beat
{
    //chord levels presented in an array to be chucked to the chord array
    [0,3,7] @=> int notes[];
    //audio to commence from the first position in the array
    0 => int position;
    
}
// Class represention identified as b
Beat b;

// Square wave oscillator ugen set to pass through a resonant low pass filter
// the to an ADSR (Attack, Decay, Sustain, Release) envelope class filter before being chucked to the dac.
SqrOsc first_osc => LPF lpf => ADSR env => dac;
// A second square wave oscillator ugen is called and sent on the same path.
SqrOsc second_osc => lpf;

// Gain and pitch values applied to the unit generators
0.5 => first_osc.gain;
0.2 => second_osc.gain;
700 => lpf.freq;

// the beat of the audio is set to 0.6s per beat
0.6::second => dur beat;
(1::ms, beat/4, 0, 1::ms) => env.set;

// offset of the tone specified as 48. 
48 => int offsetValue;
//empty variable position created.
int position;

//Infinite loop created to have this beat file play on repeat.
while(true)
{
    //subbeat of a quarter of the initial beat specified
    beat/4 => dur beat1;
    //MIDI-to-Frequency function used to compile the variable values and converting them a frequency before chucking it to the ugen frequency.
    Std.mtof(b.notes[0]+offsetValue+b.position) => first_osc.freq;
    Std.mtof(b.notes[0]+offsetValue+b.position-24) => second_osc.freq;
    
    //Chucking a true value to the ASDR to tell it to play
    1 => env.keyOn;
    //Assigning the instance when the true value is delivered
    beat1*3 => now;
    //Chucking a true value to the ASDR to tell it to play
    1 => env.keyOn;
    //Assigning the instance when the true value is delivered
    beat1*3 => now;
    //Chucking a true value to the ASDR to tell it to play
    1 => env.keyOn;
    //Assigning the instance when the true value is delivered
    beat1*2 => now;
}