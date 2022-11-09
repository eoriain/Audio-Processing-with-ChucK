// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac.
SndBuf vocalSound => dac;

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/Finish_Him.wav" => vocalSound.read;

// Value set for the gain in the audio
0.5 => vocalSound.gain;

// To play the sound from the from its beginning, its position inn the array is set as 0. 
0 => vocalSound.pos;      

// advance the time in the audio to play it for the length of the audio file.
vocalSound.length() => now; 




