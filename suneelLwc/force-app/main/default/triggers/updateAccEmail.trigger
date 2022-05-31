trigger updateAccEmail on Contact (after insert,after update) {
   set<Id> accountIds = new set<id>();
   for(contact c:Trigger.new){
     accountIds.add(c.accountId);
   }
   List<Account> accList = [select Email__c from Account where Id=:accountIds];
   
   Map<Id,String> mapCon = new Map<Id,String>();
   
   for(Contact c:Trigger.New){
     mapCon.put(c.accountId,c.Email);
   }
   
   for(Account a:accList){
      a.Email__c = mapCon.get(a.Id);
    
   }
   update accList;
}