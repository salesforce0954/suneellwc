trigger dupEmail on Account (before insert, before update) {
   
   set<string> accountId = new set<string>();
   
   if( Trigger.isBefore || Trigger.isInsert ||Trigger.isUpdate){
       for(Account acc:Trigger.new){
         accountId.add(acc.Email__c);
       }
       
       List<Account> accList = [select Email__c from Account where Email__c =: accountId];
       
       for(Account a:Trigger.new){
         if(accList.size() > 0){
           a.addError('Email alread exists in another account');
         }
       }
   
   
         
          set<string> conEmail = new set<string>();
          
          for(Account acc:Trigger.new){
            conEmail.add(acc.Email__c);
          }
          
          List<Contact> conList = [select Email,accountId from contact where Email =:conEmail];
          
          for(Account a:Trigger.new){
            if(conList.size() > 0){
              a.addError('Email already exists in Contact');
            }
          }
          
          
       
   }
}