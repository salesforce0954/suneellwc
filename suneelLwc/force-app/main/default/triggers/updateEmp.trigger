trigger updateEmp on Account (after insert,after update) {

   for(Account acc:Trigger.New){
      acc.NumberOfEmployees = 45;
      system.debug('Trigger 3'+acc.NumberOfEmployees);
   }

}