trigger updateContactCountSize on Account (before update,before delete) {

   set<id> accountIds = new set<id>();
  
  for(Account acc:Trigger.new){
    accountIds.add(acc.id);
  }
  
  for(Account acc:Trigger.old){
    accountIds.add(acc.id);
  }
  
  List<Account> accList = [select id,Total_Active_Contacts__c,(select id,accountId from contacts) from Account where id=:accountIds];
  
  Map<Id,Account> accMap = new Map<Id,Account>();
  
  for(Account a : accList){
    accMap.put(a.id,a);
  
  }
  
  for(Account accnt:Trigger.New){
     accnt.Total_Active_Contacts__c = accMap.get(accnt.id).contacts.size();
  } 
  
  

}