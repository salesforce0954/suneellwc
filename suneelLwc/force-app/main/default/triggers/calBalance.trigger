trigger calBalance on Account(after update){
      
       set<Id> accountIds = new set<Id>();
       
       for(Account acc:Trigger.New){
         accountIds.add(acc.id);
       }
       
       List<Account> accList = [select Total_salary__c,(select Id,accountId from contacts) from Account where id=:accountIds];
       Map<Id,Account> accMap = new Map<Id,Account>();
       
       for(Account a :accList){
         accMap.put(a.id,a);
       }
       List<Contact> conList = [select balance__c,accountId from Contact where accountId=:accountIds];
       
       for(Contact con:conList){
         con.balance__c = accMap.get(con.accountId).Total_salary__c/accMap.get(con.accountId).contacts.size();
       }
       update conList;
       
       
   }