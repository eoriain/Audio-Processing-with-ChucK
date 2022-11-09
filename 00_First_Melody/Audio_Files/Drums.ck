// Eoghan Ó Riain
// 111319036

//Sound Buffer unit generator sent to the dac via gain ugen.
SndBuf kick_drum => Gain master => dac;   

// wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
me.dir()+"/audio/kick_01.wav" => kick_drum.read;

// Value set for the gain in the audio
0.5 => kick_drum.gain;
//the duration of the tempo is specified
0.15 :: second => dur tempo;

// scores (arrays) to tell drums when to play
[1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0] @=> int kickHits[];

//infinite loop created to have the drums play indefinitely
while (true)
{
    0 => int beat;
    while (beat < kickHits.cap())
    {
        // play kick drum on based on array value
        //conditional statement added to check the location within the array to determine if the audio file should be played
        if (kickHits[beat])  
        {                    
            0 => kick_drum.pos;  
        }
        //command to advance time and allow the audio be played
        tempo => now;  
        //increments the beat in the while loop
        beat++;           
    }                        
}
