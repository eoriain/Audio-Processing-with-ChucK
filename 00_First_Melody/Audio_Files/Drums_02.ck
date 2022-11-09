// Eoghan Ó Riain
// 111319036

//function created to allow kick drum to be sporked to the Virtual Machine
fun void kickDrum()
{
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
        // play kick drum on based on array value
        //conditional statement added to check the location within the array to determine if the audio file should be played
        0 => int beat;
        while (beat < kickHits.cap())
        {
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
}
//function created to allow snare drum to be sporked to the Virtual Machine
fun void snare()
{
    //Sound Buffer unit generator sent to the dac via gain ugen.
    SndBuf snare_drum => Gain master => dac;             

    // wav file located by assembling the filepath with its name before reading it into the Sound Buffer.
    me.dir()+"/audio/snare_01.wav" => snare_drum.read;

    // Value set for the gain in the audio
    0.5 => snare_drum.gain;
    //the duration of the tempo is specified
    0.15 :: second => dur tempo;

    // scores (arrays) to tell drums when to play
    [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0] @=> int snareHits[];

    //infinite loop created to have the drums play indefinitely
    while (true)
    {
        0 => int beat;
        while (beat < snareHits.cap())
        {
            // play kick drum on based on array value
            //conditional statement added to check the location within the array to determine if the audio file should be played
            if (snareHits[beat])
            {                   
                0 => snare_drum.pos;  
            }
            //command to advance time and allow the audio be played
            tempo => now;   
            //increments the beat in the while loop     
            beat++;             
        }                        
    }
}
// sporking both drum functions to the virtual machine
spork ~ kickDrum();
spork ~ snare();

//looping iteration duration set
while( true ) 1::second => now;