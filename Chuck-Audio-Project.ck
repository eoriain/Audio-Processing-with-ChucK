// Eoghan Ó Riain
// 111319036

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/EventHandling.ck") => int Interact;
//Duration of audio file specified to determine when next file is added.
0.1 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/Fade.ck") => int Fade;
//Duration of audio file specified to determine when next file is added.
1.3 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/00_First_Melody/First_Melody.ck") => int First_Melody;
//Duration of audio file specified to determine when next file is added.
59.0::second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/Eerie.ck") => int Eerie;
//Duration of audio file specified to determine when next file is added.
6.0 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Eerie);
//Duration of audio file specified to determine when next file is processed.
0.1 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/01_Second_Melody/Second_Melody.ck") => int Second_Melody;
//Duration of audio file specified to determine when next file is added.
60.5 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/rewind.ck") => int Rewind;
//Duration of audio file specified to determine when next file is added.
4.7 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/00_First_Melody/First_Melody.ck") => int First_Melody02;
//Duration of audio file specified to determine when next file is added.
59.15::second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/Eerie.ck") => int Eerie02;
//Duration of audio file specified to determine when next file is added.
6.0 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Eerie02);
//Duration of audio file specified to determine when next file is processed.
0.1 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/01_Second_Melody/Second_Melody.ck") => int Second_Melody02;
//Duration of audio file specified to determine when next file is added.
60.5 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/Level_Down.ck") => int Level_Down;
//Duration of audio file specified to determine when next file is added.
1.1 :: second => now;

//Use Machine.add() to locate the specific Chuck file by combining its filepath and its name before chucking it to its integer identifier.
//This function is used to add the specified chuck file to the Virtual Machine.
Machine.add(me.dir()+"/02_Extra_Audio/Victory.ck") => int Victory;
//Duration of audio file specified to determine when next file is added.
1.5 :: second => now;

//Use Machine.remove() to remove files with an infinte loop from the Virtual Machine.
Machine.remove(Interact);
//Duration of audio file specified to determine when next file is processed.
0.1 :: second => now;