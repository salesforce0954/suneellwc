trigger updateAccHistory on Account(after update){

 set<id> accountids = new set<id>();
 
  for(Account acc : Trigger.New){
     accountids.add(acc.id);
  }
  
  List<Application__c> ahlist = [select account__c,Amount__c from Application__c where account__c =: accountids];
  
  Map<Decimal,Account> accMap = new Map<Decimal,Account>();
   Map<Id,Account> accMap1 = new Map<Id,Account>();
  
  for(Account a : Trigger.new){
     accMap.put(a.Max_Salary__c,a);
  }
  
   for(Account a1 : Trigger.new){
     accMap1.put(a1.id,a1);
  }
  
  
  for(Application__c ah:ahlist){
  
    if(accMap.containsKey(456)){
        ah.Amount__c = accMap1.get(ah.account__c).Max_Salary__c;
    }
  
  }
  
  update ahlist;

}