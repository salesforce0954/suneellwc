trigger seachPanAndUpdateAmount on Application__c (before update,after update) {

   if(Trigger.isBefore || Trigger.isAfter || Trigger.isUpdate){
     if(!system.isFuture() && !system.isBatch()){
        updateContactusingAccount uc = new updateContactusingAccount();
        string id = database.executeBatch(uc);
        system.debug('is Batch True ? '+system.isBatch());
        system.debug('is Future True ? '+system.isFuture());
       }
   }
}