// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac.
SndBuf levelDownSound => dac;

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/smb_powerup.wav" => levelDownSound.read;

// Duration of the wav file is determined in samples.
levelDownSound.samples() => int numSamples;

// To reverse the wav file first the position must be set to the end of the buffer
numSamples => levelDownSound.pos;
//Next, the rate at which the wav file is played is set to -1 to reverse it
-1.0 => levelDownSound.rate;    

// Plays the finalised piece of audio for its full duration
second => now;  

