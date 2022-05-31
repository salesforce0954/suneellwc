trigger prevenDuplicateAccs on Account (before insert,before update) {

  for(Account acc:Trigger.New){
  
   List<Account> accList = [select id,Name from Account where Name =: acc.Name];
   
   if(accList.size() > 0){
     acc.addError('Duplicate Found');
   }
  
  
  }

}