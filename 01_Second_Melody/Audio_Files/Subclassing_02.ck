// Eoghan Ó Riain
// 111319036

// Private class created for the VibratoSinOsc sound effect
// Class contains data and a function
// Example of subclassing used to have the VibratoSinOsc extend the Sin Wave Oscillator
private class VibratoSinOsc extends SinOsc
{
    //Chuck the sine wave oscillator ugen to "this". "this" refers to objects that are instances of this class.
    SinOsc vib => this;
    //Specific values are applied to the attributes of the ugen 
    2 => this.sync;
    10 => vib.freq;
    8 => vib.gain;
    48 => int offsetValue; 
    
    //function created to assign frequency value to the class using MIDI-to-Frequency function
    fun void note(int position)
    { 
        Std.mtof(position + offsetValue) => this.freq;
    }
}
//the class is then chucked to the dac
VibratoSinOsc first_osc => dac;

//Specific values are applied to the attributes of the oscillator 
0.2 => first_osc.gain;
200 => first_osc.freq;

//array of chord values and offset specified
[0,0,0,2] @=> int rhythm[];
24 => int offset;

//infinite loop created
while(true)
{
    //for loop created to cycle through the array of chord values
    for(0 => int i; i < rhythm.cap(); i++)
    {
        rhythm[i] => first_osc.note;
        5::second / 8 => now;
    }
}
