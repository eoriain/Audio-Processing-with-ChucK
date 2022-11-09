// Eoghan Ó Riain
// 111319036

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/coin.ck") => int coin;
//Duration of audio file specified to determine when next file is added.
0.6  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Function01.ck") => int Melody;
//Duration of audio file specified to determine when next file is added.
14.0 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/coin.ck") => int coin2;
//Duration of audio file specified to determine when next file is added.
0.4 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Drums.ck") => int Drums;
//Duration of audio file specified to determine when next file is added.
14.81 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Drums);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Drums_02.ck") => int Drums_02;
//Duration of audio file specified to determine when next file is added.
14.1  :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Beeping.ck") => int Beeps;
//Duration of audio file specified to determine when next file is added.
0.5 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Beeps);
//Duration of audio file specified to determine when next file is processed.
0.01 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Drums_02);
//Duration of audio file specified to determine when next file is processed.
14.25 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Melody);
//Duration of audio file specified to determine when next file is processed.
0.05 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/Audio_Files/Subclassing.ck") => int Close;
//Duration of audio file specified to determine when next file is added.
2.0 :: second => now;