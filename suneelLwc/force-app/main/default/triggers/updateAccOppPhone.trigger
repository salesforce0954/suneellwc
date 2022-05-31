trigger updateAccOppPhone on Contact (after update) {
  set<Id> accountIds = new set<Id>();
  for(contact c: Trigger.new){
    accountIds.add(c.accountId);
  }
  List<Opportunity> oppList = [select id,accountId,city__c from opportunity where accountId in:accountIds];
  List<Account> accList = [select id,phone from Account where id in : accountIds];
  Map<Id,contact> conMap = new Map<id,contact>();
  
   for(Contact con: trigger.new){
    conMap.put(con.accountId,con);
  } 
  
  for(Opportunity opp:oppList){
    opp.city__c = conMap.get(opp.accountId).phone;
  }
  for(Account acc: accList){
   acc.phone = conMap.get(acc.id).phone;
  }
  
  update accList;
  update oppList;
}