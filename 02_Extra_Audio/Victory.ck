// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac.
SndBuf victorySound => dac;

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/Flawless-victory.wav" => victorySound.read;

// Value set for the gain in the audio
0.5 => victorySound.gain;

// To play the sound from the from its beginning, its position inn the array is set as 0. 
0 => victorySound.pos;     

// advance the time in the audio to play it for the length of the audio file.
victorySound.length() => now;           




