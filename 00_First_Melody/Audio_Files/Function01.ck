// Eoghan Ó Riain
// 111319036

//Two ugen created
//both are triangular wave oscillators which are passed through an ASDR (Attack, Decay, Sustain, Release) envelope filter before being sent to the dac.
TriOsc first_osc => ADSR first_env => dac;
TriOsc second_osc => ADSR second_env => dac;

//beat duration and steps set
0.9::second => dur beat;
(beat /2, beat /2, 0, 1::ms) => first_env.set;
(1::ms, beat / 8, 0, 1::ms) => second_env.set;

// Settings applied to the audio generation.
0.5 => first_osc.gain;
0.2 => second_osc.gain;

//note arrays created to be applied to the major and minor arrays
[0,4,7,12] @=> int mj[];
[0,3,7,12] @=> int mn[];

//offset value of 48 created
48 => int offsetValue;
//empty variable position created
int position;

//function developed to play mj and mn arrays
fun void playAudio(int position, int notes[])
{
  //for loop created to iterate through the arrays
  for(0 => int i; i < 4; i++)
    {
        Std.mtof(notes[0] + offsetValue + position) => first_osc.freq;
        1 => first_env.keyOn;
        
        //for loop created to iterate through the arrays
        for(0 => int j; j < 4; j++)
        {
            Std.mtof(notes[j] + offsetValue + position + 12) => second_osc.freq;
            1 => second_env.keyOn;
            beat / 8 => now;
        }
    }  
}
//infinite loop created
while(true)
{
    //function called with position identified and arrays specified.
    playAudio(0, mn);
    playAudio(-4, mj);
    playAudio(-2, mj);
    playAudio(-5, mj);
    
    playAudio(-7, mn);
    playAudio(-2, mj);
    playAudio(3, mj);
    playAudio(-5, mj);

}