// Eoghan Ó Riain
// 111319036

// New Hid object created
Hid hid_object;                

// Hid message holder created to convey data from Hid device
HidMsg message;             

// Identifies which keyboard to access from the device number
0 => int device;        

// Conditional statement used to open the keyboard. If the condition fails then it will exit
if( !hid_object.openKeyboard( device ) ) me.exit(); 

// print a message!           // (5) Prints message if success.
<<< "Press keys on your " + hid_object.name() + " to play along!", "" >>>;

// sound chain for Hid keyboard controlled organ
HevyMetl first_osc => PRCRev Rev_filter => dac; // (6) Organ UGen through reverb to dac.

// Createing an infinite event loop with a while statement
while( true )
{
    // Statement to wait for the keyboard event
    hid_object => now;                   
    // Delivers message from the keyboard event to represent the keys pressed
    while( hid_object.recv( message ) )      
    {
        // conditional statement to play the tone when the key is pressed down on the keyboard
        if( message.isButtonDown() )
        {                         
            // take ascii value of button and converts it to freq
            Std.mtof( message.ascii ) => first_osc.freq;
            // Plays the corresponding note
            1 => first_osc.noteOn;    
        }
        //When the key is released the tone will stop
        else 
        {
            // turning off the note when the key is released
            0 => first_osc.noteOff;   
        }
    }
}

