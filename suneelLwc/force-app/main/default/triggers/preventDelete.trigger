trigger preventDelete on account(before delete){
   set<Id> accountIds = new set<Id>();
   
   for(Account acc:Trigger.Old){
     accountIds.add(acc.id);
   }
   
   List<Account> accList = [select id,name,(select id from contacts) from Account where id=:accountIds];
   
   Map<Id,Account> mapAcc = new Map<Id,Account>();
   
   for(Account a:accList){
      mapAcc.put(a.id,a);
   }
   
   for(Account a:Trigger.old){
      if(mapAcc.get(a.id).contacts.size() > 1){
        a.addError('You cannot delete the accounts');
      }
   }
   
 }