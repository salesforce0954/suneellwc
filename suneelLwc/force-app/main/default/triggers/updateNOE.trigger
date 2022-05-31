trigger updateNOE on Account (before insert,before update) {
    for(Account acc:Trigger.New){
      acc.NumberOfEmployees = 25;
      system.debug('Trigger 2'+acc.NumberOfEmployees);

   }

}