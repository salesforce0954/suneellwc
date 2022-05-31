trigger updateRelatedOpp on Account (after update){

  set<Id> accountIds = new set<Id>();
  
  for(Account acc:Trigger.New){
    accountIds.add(acc.id);
  }
  
  List<Opportunity> oppList = [select id,accountId,name from Opportunity where accountId =:accountIds];
  
  Map<Id,Account> mapAcc = new Map<Id,Account>();
  
  for(Account a: Trigger.new){
    mapAcc.put(a.id,a);
  }
 
 
  for(Opportunity opp:oppList){   
   opp.name = mapAcc.get(opp.accountId).name;
  }
  
  update oppList;

}