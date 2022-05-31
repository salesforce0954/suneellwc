trigger updateAccRating on Opportunity(after update){
  set<Id> accountIds = new set<Id>();
  
  for(Opportunity opp:Trigger.New){
    accountIds.add(opp.accountId);
  }
  
  List<Account> accList = [select rating from Account where id=:accountIds];
  List<Opportunity> oppList = [select stageName,accountId from opportunity where accountId =:accountIds];

  for(Account a : accList){
    for(Opportunity p: oppList){
      if(p.stageName == 'Closed Won'){
        a.Rating = 'Hot';
      }
    }
}  

update accList;
  
  
  
}