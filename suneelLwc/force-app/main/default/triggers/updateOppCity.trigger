trigger updateOppCity on opportunity (after update){

  Map<id,opportunity> mapOpp = new Map<id,opportunity>();
  
  for(Opportunity opp:trigger.new){
    mapOpp.put(opp.accountId,opp);
  }
  
  List<Account> accList = [select city__c from Account where id=:mapOpp.keySet()];
  
  for(Account a:accList){
    a.city__c = mapOpp.get(a.id).city__c;
  }
  update accList;
}