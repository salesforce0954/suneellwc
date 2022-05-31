trigger updateNumberOfEmployees on Account (before insert,before update) {

   for(Account acc:Trigger.New){
      acc.NumberOfEmployees = 15;
      system.debug('Trigger 1'+acc.NumberOfEmployees);
   }

}