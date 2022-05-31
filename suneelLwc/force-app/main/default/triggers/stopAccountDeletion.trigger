trigger stopAccountDeletion on Account(before insert){

   set<String> accountIds = new set<String>();
   
   for(Account acc:Trigger.New){
     accountIds.add(acc.Email__c);
   }
   /**
   List<Account> accList = [select Id,(select Id from contacts) from Account where Id=:accountIds];
   
   integer count;
   
   if(accList.size() > 0){
   
   for(Account acc:accList){
     count = acc.contacts.size();
     }
   }
   
   for(Account a:Trigger.Old){
      if(count > 1){
       a.addError('You cannot delete the Account as the size of the contact is greater than 1');
      }
   } */
   
   List<Account> checkEmail = [select Email__c from Account where Email__c=:accountIds limit 1];
   
   for(Account a: Trigger.New){
       if(checkEmail.size() > 0){
         a.addError('Account Email already exists');
       }
   }
   
   
}