// Eoghan Ó Riain
// 111319036

// Private class created for the MusicalTriOsc sound effect
// Class contains data and a function
// Example of subclassing used to have the MusicalTriOsc extend the Triangle Wave Oscillator
private class EndingTriOsc extends TriOsc
{
    //Chuck the sine wave oscillator ugen to "this". "this" refers to objects that are instances of this class.
    //offset value of 48 created
    48 => int offsetValue; 
    //function created to assign frequency value to the class using MIDI-to-Frequency function
    fun void note(int position)
    { 
        Std.mtof(position + offsetValue) => this.freq;
    }
}
//the class is then chucked to the dac via the ASDR (Attack, Decay, Sustain, Release) envelope filter 
EndingTriOsc first_osc => ADSR env => dac;;

//beat duration and rate established
0.9::second => dur beat;
(1::ms, beat / 8, 0, 1::ms) => env.set;

//value for the gain applied to the oscillator
0.5 => first_osc.gain;

//array of chord values specified
[0,4,7,12] @=> int notes[];

//for loop created to iterate through the chord array
for(0 => int i; i < notes.cap(); i++)
{
    notes[i] => first_osc.note;
    1 => env.keyOn;
    1::second / 8 => now;
}
//duration of the audio piece specified
1.0 :: second => now;
