// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac.
SndBuf clapSound => dac;

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/Clap_28_480.wav" => clapSound.read;

// Infinite loop created to have the audio file play continuously  at regular intervals.
while( true )
{
    // Value set for the gain in the audio
    1 => clapSound.gain;
    
    // To play the sound from the from its beginning, its position inn the array is set as 0. 
    0 => clapSound.pos;     
    
    // advance the time in the audio to play it for the length of the audio file with added gap for silence between audio plays.
    1.20::second => now; 
}



