trigger insertConName on Account(after update) {

Map<Id,Account> accMap = new Map<Id,Account>();

  for(Account a:Trigger.new){
    accMap.put(a.id,a);
  }  
  
  List<Contact> conList = [select totalSales__c,accountId from Contact where accountId=:accMap.keySet()];
  
  
  
  for(contact c:conList){
    c.totalSales__c = accMap.get(c.accountId).Total_Salary__c;
  }
  
  update conList;
  
}