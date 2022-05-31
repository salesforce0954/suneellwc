trigger updateCityy on Opportunity (after update){

  set<Id> accountIds = new set<Id>();
  
 for(Opportunity opp:Trigger.New){
   accountIds.add(opp.accountId);
 }
  List<Account> accList = [select id,city__c from Account where Id =: accountIds];
  List<Opportunity> oppList = [select id,accountId,City__c from Opportunity where accountId =: accountIds];
  
  
  Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity>();
  
  for(Opportunity p:oppList){
   mapOpp.put(p.accountId,p);
  }
  
  for(Account acc:accList){
    acc.City__c = mapOpp.get(acc.id).City__c;
  }
 
  
  update accList;
  

}