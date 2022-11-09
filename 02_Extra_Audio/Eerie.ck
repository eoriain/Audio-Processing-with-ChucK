// Eoghan Ó Riain
// 111319036

// Private class created for the Eerie sound effect (to represent a change in video game level)
// Class contains data and functions 
private class Eerie {
    // White noise ugen set to pass through a resonant low pass filter
    // LPF set to Pan2 to spread the mono-signal to stereo before being chucked to the dac.
    Noise first_osc => LPF lpf => Pan2 P1 => dac; 
    // Settings applied to the audio generation.
    200.0 => lpf.freq;
    100.0 => lpf.Q;
    0.05 => lpf.gain;
    // Random value between -1 and 1 to be applied to the panning attribute of the audio to have it randomly move around the listener. 
    Math.random2f(-1.0,1.0) => P1.pan;

    // Example of function overloading shown below where the pitch value is set as a float frequency or using An integer MIDI note number  
    // Setting the pitch as a float frequency in Hertz.
    fun float pitch(float freq)        
    {
        return freq => lpf.freq;
    }
    // Sets pitch using an integer MIDI note number.
    fun float pitch(int noteNum)       
    {
        return Std.mtof(noteNum) => lpf.freq;
    }
}
// Class represention identified as e
Eerie e;                           

// Infinite loop created
while (true) 
{               
    // pitch as the MIDI integer pitch setting function
    e.pitch(Math.random2f(50.0,60.0));    
    0.1 :: second => now;

    // pitch as the float pitch-setting function
    e.pitch(Math.random2f(250,350.0)); 
    0.1 :: second => now;
}
    

