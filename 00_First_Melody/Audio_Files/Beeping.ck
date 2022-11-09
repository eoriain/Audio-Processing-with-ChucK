// Eoghan Ó Riain
// 111319036

// Private class created for the Beeping sound effect
// Class contains data and functions 
private class Beeping {
    // Impulse ugen set to pass through a resonating filter before being chucked to the dac.
    Impulse first_osc => ResonZ Res_filter => dac;
    // Settings applied to the audio generation.
    100.0 => Res_filter.Q => Res_filter.gain;
    1000.0 => Res_filter.freq;

    // set freq as we would any instrument
    fun void freq(float freq)          // (3) Frequency setting method
    {
        freq => Res_filter.freq;
    }

    // method to allow setting Q
    fun void setQ(float Q)             // (4) Resonance (Q) setting method
    {
        Q => Res_filter.Q;
    }

    // method to allow setting gain
    fun void setGain(float gain)       // (5) Gain setting method
    {
        Res_filter.Q() * gain => first_osc.gain;
    }

    // play a note by firing impulse
    fun void noteOn(float volume)      // (6) noteOn sets impulse to make a click
    {
        volume => first_osc.next;
    }
    // Example of function overloading shown below where the pitch value is set as a float frequency, using An integer MIDI note number or a note name (string).  
    // Setting the pitch as a float frequency in Hertz.
    fun float pitch(float freq)
    {
        return freq => Res_filter.freq;
    }
    // Sets pitch using an integer MIDI note number.
    fun float pitch(int noteNum)  
    {
        return Std.mtof(noteNum) => Res_filter.freq;
    }

    // Sets pitch using a note name (string). This needs specific format calls, e.g. C4, D#5, Eb3, As3, Bf6
    fun float pitch(string noteName)  
    {
        //Note values from A to G
        [21,23,12,14,16,17,19] @=> int notes[];
        // Manipulate ASCII code to come up with array pointer
        noteName.charAt(0) - 65 => int base;
        notes[base] => int note;
        0.0 => float freq;
        // conditional statement set up to evaluate string value
        if (base > -1 && base < 7) {
            if (noteName.charAt(1) == '#')
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 's') 
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 'b')
                notes[base] - 1 => note;
            if (noteName.charAt(1) == 'f')
                notes[base] - 1 => note;
        }
        // if the conditions are not met then a message is issued to the user in the console
        else {
            <<< "Illegal Note Name!!" >>>;
            return 0.0;
        }
        noteName.charAt(noteName.length()-1) - 48 => int oct;
        //conditional statement to call the MIDI pitch function based off the note number
        if (oct > -1 && oct < 10) {
            note + 12*oct => note;   
            return this.pitch(note); 

        }
        // if the conditions are not met then a message is issued to the user in the console
        else {
            <<< "Illegal Octave!!" >>>;
            return 0.0;
        }
    }
}
// Class represention identified as b
Beeping b;                           
// infinite loop created
while (true) {  
    // pitch as the MIDI integer pitch setting function                      
    b.pitch(Math.random2f(40.0,80.0));   
    1 => b.noteOn;
    0.1 :: second => now;
    // pitch as the float pitch-setting function
    b.pitch(Math.random2f(200,600.0)); 
    1 => b.noteOn;
    0.1 :: second => now;
    // pitch as note name string function
    b.pitch("E#5"); 
    1 => b.noteOn;
    0.1 :: second => now;
}
    
