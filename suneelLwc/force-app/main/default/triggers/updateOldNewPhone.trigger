trigger updateOldNewPhone on Account(after update){
  
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    for(Account acc:Trigger.new){
      accMap.put(acc.id,acc);
    }
    
    List<contact> conList = [select homePhone ,otherPhone ,accountId from contact where accountId in :accMap.keySet()];
    
    for(Contact c:conList){
      c.homePhone = trigger.oldMap.get(c.accountId).Phone;
      c.otherPhone = trigger.newMap.get(c.accountId).Phone;
    }
    update conList;
}