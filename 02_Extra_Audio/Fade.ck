// Eoghan Ó Riain
// 111319036

// Sine wave oscillator sent to the dac for unit generation
SinOsc osc => dac;
// value assigned to the gain of the tone
0.3 => osc.gain;

//for loop included to iterate through a range of frequencies to create a fading sound effect
for(3000 => int i; i > 0; i--)
    {
        //iteration value chucked to the unit frequency
        i => osc.freq;
        //duration of tone assigned
        0.5::ms => now;
    
    } 