// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac.
SndBuf rewindSound => dac;

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/mixkit-tape-rewind-cinematic-transition-1088.wav" => rewindSound.read;  

// Value set for the gain in the audio
0.5 => rewindSound.gain;

// To play the sound from the from its beginning, its position inn the array is set as 0. 
0 => rewindSound.pos;  

// advance the time in the audio to play it.
4.8::second => now;
