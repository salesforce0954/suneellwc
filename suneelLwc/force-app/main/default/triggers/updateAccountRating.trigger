trigger updateAccountRating on Opportunity (after update){
  
     set<Id> accountIds = new set<Id>();
     for(Opportunity oppList:trigger.new){
     if(oppList.StageName == 'Closed Won'){
       accountIds.add(oppList.accountId);
      }
     }
     List<Account> accList = [select Rating from Account where id=:accountIds];
     
     
    for(Account acc: accList){     
        
          acc.Rating = 'Hot';
        } 
      
    
    update accList;

}