trigger duplicateAccountEmail on Contact (before insert,before update) {
   
   for(contact c :Trigger.New){
      List<Account> accList = [select id,Email__c from Account where Email__c = : c.email];
      
      if(accList.size() > 0){
        
        c.AccountId = accList[0].id;
         
      }
   }
  
   
}