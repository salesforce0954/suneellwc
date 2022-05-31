trigger addPrefixDr on Lead(before insert,before update){

  for(Lead l:Trigger.New){
   l.lastname = 'Dr '+l.lastname;
  }
}