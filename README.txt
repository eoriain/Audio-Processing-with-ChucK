Name: Eoghan O Riain
Student Number: 111319036
Module: CS6117 - Audio Processing
Assignment: Chuck Assignment

Although it was not requirement, my goal for this project was to create a coherent videogame-like audio track to represent the user’s progression through the levels. I did this my creating two separate tracks (First_Melody.ck and Second_Melody.ck) to represent to different stages of the game. I combined these two audio files by using the Machine.add() function and eased the transition between the two tracks by including separate audio file.

This project was broken up into 4 specific categories with requirement associated with each:
Audio Components
Programming Components
Concurrency and Process Components
Bonus Components

Below is a breakdown of how I approached each requirement to deliver the final product.

Audio Components:
- Use a minimum of 4 different unit generators.
A unit generator can have several input parameters but only one output. Below are the core Unit Generators (ugen) use in the Chuck sound file to achieve the appropriate level of audio content. In order include added effects to the core ugen, the core ugen would often be passed through additional ugens such as ResonZ, LPF, SawOsc or ADSR.
Impulse - Pulse Generator
TriOsc - Triangle Wave Osc
SinOsc - Sine Oscillator
SawOsc - Sawtooth Wave Ocillator
SqrOsc - Square Wave Ocillator
SndBuf - Sound Buffer
Noise - White Noise Generator
In order include added effects to the core ugen, the core ugen would often be passed through additional ugens such as ResonZ, LPF, Envelope, SawOsc or ADSR. The audio would then be "chucked" to the digital/analog converter (dac) for audio output.

- Generate sounds using a random number generator
Within my "Beeping" class, I have included a Math.random2f function in order to generate random numbers between 1100 and 1200 and "chuck" it to the beeping class frequency. In this instance, it occurs every 0.1 seconds.
I also used Math.random2f to randomise the panning in the Eerie.ck file for values between -1 and 1.

- Include examples of the MIDI-to-frequency function
The MIDI-to-frequency function is used of several occasions throughout my chuck audio project. Examples of it being used can be seen in my Beat, Rhythm, Beeping and Function01 (Melody) chuck files. The purpose of this function is to convert a MIDI note number to a frequency from a flout value and "chucking" it to the oscillator frequency.

- Store and playback notes (melodies) from arrays
Within my drum audio file, snare drum and kick drum wav sample files are loaded. Next, an array was developed to instruct the sample when to played (1 to play the audio, 0 to pause). I then use an if statement to instruction the audio file how to read the array. Refer to the "Programming Component" section below for further elaboration on the if statement.

- Loading and disposing of sound files
As part of this project, I included a number of recognisable audio sample in order to enforce a video game level progression feel to my final piece of audio. See the list before of audio samples used:
Sonic the hedgehog - Ring Sample
Super Mario - Level-Up
Mortal Kombat - "Finish Him"
Mortal Kombat - "Flawless Victory"
Standard Rewind
Standard Clap
Standard Kick Drum
Standard Snare Drum
I do this through the use of a SndBuf ugen and "chucking" the sample to the reader before advancing time so the audio sample can be heard.

- Sound file processing and manipulation (e.g. temporal, frequency, amplitude, and spatial).
A level of processing and manipulation has been applied to each of the sound files added to this project. The main processing being applied to each of the samples is adjustments to its gain and position. However, I duplicated my level-up sample and manipulated the playback rate to -1 to have the sample play backwards. This created a "level-down" sound effect.

Programming Components:
- Demonstrate the use of conditional statements
Conditional statements were demonstrated in the development of the drumming element of the audio file. My drumming component uses scores to instruct the wav file for the drum when to play. The conditional statement is used to check the array at the location beat to see if it should play the snare drum / kick drum at the present point in time.

- Demonstrate the use of two different types of looping constructs (e.g. for, repeat and while loop)
There are two types of looping constructs used on several occasions throughout the chuck audio files. These two looping and constructs are the "for" and "while" loops.
The for loop is used to control a specific number of iterations of the audio code. I do this by declaring a temporary variable in order to track the current index of the loop which is subsequently evaluated and incremented upon each iteration of the loop
The while loop will run the code contained within its body as long as its condition is evaluated as non-zero. This is used on multiple occasions throughout my code in order to create an infinite loop that will play the audio until it is removed from the virtual machine.

- Create a minimum of 3 functions
Within this project, multiple functions have been written. The benefit of using functions within the code is that they provide ways to break up code/common tasks into individual units. This helps to promote code re-usability and readability. Four examples of functions within my code are as follows:
Function_01.ck - playAudio()
Drums_02.ck - snare()
Drums_02.ck - kickDrum()
Beeping.ck - pitch()
Please note that the number of functions within this project is not limit to the above.

- Demonstrate 2 examples of function overloading
Function overloading allows a function to act differently dependant on its arguments. This allows the user to interact with the classes using meaningful function names, and the class and object instance figures out what to do based on the argument. The first instance of function overloading present in this project is in the Beeping.ck file. In this file there are three methods of setting the pitch in this audio piece (by float, by MIDI note and by string). A similar approach was taken in the Eerie.ck file in which there here are two methods of setting the pitch in this audio piece (by float and by MIDI note)

- Create at least 3 examples of Classes, with members (data + functions)
Within my chuck files I have included three examples of Classes and they are as follows:
Beeping
Beat
Rhythm
VibratoSinOsc
EndingTriOsc
The above classes were written as a private classes to allow for repeated use when played withing the virtual machine. the purposed of my classes are to define the hidden code that the object will implement and/or variables that the object will contain.
The Beat and Rhythm classes are relatively simple classes containing only data. However, the beeping class, the VibratoSinOsc and EndingTriOsc classes contains both data and functions.

- Demonstrate 2 examples of subclassing
Chuck provides a number of options for extending its standard library of functions, classes, and unit generators. The easiest way is through public classes. When a subclass is created, it inherits all functions and variables from the parent class Clarinet. Two subclasses have been created as part of this project. The first subclass is located in the Subclassing.ck file. In this file, my EndingTriOsc class has been extended through my TriOsc ugen to create a closing musical tone for my first section of audio. The second subclass is located in the Subclassing_02.ck. Within this file, my VibratoSinOsc class has been extended to the SinOsc ugen. The functions and data present in this subclass creates a modulation of pitch in the audio to replicate bass vibrations for my second audio section.

Concurrency and Process Components:
- Demonstrate the use of Machine.add
The way I approached the development of audio files was to develop a number of individual chuck file which would contain specific pieces of audio coding. In order to combine my file into one complete track, I used the Machine.add (and Machine.remove) function. To use this function, I identified the location of a specific chuck file in the folder directory and "chucked" it to an identify. Finally, I specified the duration that they would play for before the next audio file would be loaded.

- Use at least 4 shreds in your program
One of the benefits of using Chuck is its ability to run multiple codes concurrently. A shred is initially shreduled to execute immediately with further shreduling beyond this point is left to the shred. This project contains multiple chuck files with contain their own timing information. Therefore, when each shred is sent to the virtual machine its shreduling is applied. At its peak, the audio piece has a maximum of 8 shreds within the virtual machine being processed concurrently. This value varies through the project duration.

- Demonstrate the use of sporking
To spork means to shredule a new shred. Within my code I have included three instances of sporking. The first two sporks are located with the Drums_02.ck file, in which the kickDrum() and snare() function calls are sporked to the virtual machine. As well as this, in the Rhythm.ck the Start() function is also sent to the virtual machine when called.

Bonus Components
- Incorporate an example of event generation and handling.
An EventHandling.ck file was created and set to run for the duration of the audio file. This file accesses the user's keyboard and delivers them a message via the console to press keys on the keyboard to play along with the music. The audio from keyboard interaction is developed by generating sound through the HevyMetl ugen and passing it through a PRCRev. 

- Audio duration (4-6 minutes)
The total runtime of the final audio file is 4 minutes 22 seconds.
