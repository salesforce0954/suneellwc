trigger updateAccCity on Opportunity (after update){

  set<Id> accountIds = new set<Id>();
  
  for(Opportunity opp:Trigger.New){
    accountIds.add(opp.accountId);
  }
  
  List<Account> accList = [select city__c from account where id in :accountIds];
  
  Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity>();
  
  for(Opportunity op:Trigger.new){
    mapOpp.put(op.accountId,op);
  }
  
  for(Account acc: accList){
    acc.city__c = mapOpp.get(acc.id).city__c;
  }
  
  update accList;

}