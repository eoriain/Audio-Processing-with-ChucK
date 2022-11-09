// Eoghan Ó Riain
// 111319036

// Sine wave oscillator sent to the dac for unit generation
SinOsc osc => dac;
// value assigned to the gain of the tone
0.2 => osc.gain;

//for loop included to iterate through a range of frequencies to create a rising tone sound effect
for(0 => int i; i < 2000; i++)
    {
        //iteration value chucked to the unit frequency
        i => osc.freq;
        //duration of tone assigned
        0.3::ms => now;
    
    } 