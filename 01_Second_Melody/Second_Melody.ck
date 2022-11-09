// Eoghan Ó Riain
// 111319036

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Level_Up.ck") => int LevelUp;
//Duration of audio file specified to determine when next file is added.
1.2 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Beat.ck") => int Beat;
//Duration of audio file specified to determine when next file is added.
10.15 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/clap.ck") => int Clap;
//Duration of audio file specified to determine when next file is added.
7.5  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/vocal.ck") => int Finish_Him;
//Duration of audio file specified to determine when next file is added.
0.95  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Rise.ck") => int Rise;
//Duration of audio file specified to determine when next file is added.
1.21  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Subclassing_02.ck") => int Vibrato;
//Duration of audio file specified to determine when next file is added.
0.01  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Rhythm.ck") => int Rhythm;
//Duration of audio file specified to determine when next file is added.
40.0  :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Beat);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Rhythm);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Vibrato);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Clap);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;