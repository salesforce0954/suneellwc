trigger preventDeleteAccount on Account (before delete) {

  Map<id,Account> mapAccOne = new Map<id,Account>();
  
  for(Account acc:Trigger.old){
    mapAccOne.put(acc.id,acc);
  }
  
  List<Account> accList = [select id,name,(select id from contacts) from Account where id=:mapAccOne.keySet()];
  
 
  for(Account acc:accList){
   mapAccOne.put(acc.id,acc);
  }
  
   for(Account acc:trigger.old){
    if(mapAccOne.get(acc.id).contacts.size() > 2){
      acc.addError('You cannot delete the account');
    }
  } 
}