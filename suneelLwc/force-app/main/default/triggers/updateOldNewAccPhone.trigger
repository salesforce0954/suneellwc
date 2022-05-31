trigger updateOldNewAccPhone on Account (after update) {
  set<id> accountIds = new set<Id>();
  for(Account acc:Trigger.New){
    accountIds.add(acc.id);
  }
  List<Contact> conList = [select accountId,homePhone,otherPhone from contact where accountId =:accountIds];
  
  Map<id,Account> mapAcc = new Map<Id,Account>();
  
  for(Account a : Trigger.new){
    mapAcc.put(a.id,a);
  }
  
  for(Contact c: conList){
    c.homePhone = trigger.newMap.get(c.accountId).Phone;
    c.otherPhone = trigger.oldMap.get(c.accountId).Phone;
  }
  
 
  update conList;
}