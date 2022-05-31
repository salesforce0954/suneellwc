trigger updateSalAccName on Account (after update) {
  set<Id> accountIds = new set<Id>();
  for(Account acc : Trigger.New){
    accountIds.add(acc.id);
  }
  List<Account_Salary__c> aslist = [select id,Name,Salary__c,account__c from Account_Salary__c where account__c = : accountIds];
  List<Account> alist = [select id,Name,Total_salary__c from Account where id = : accountIds];
  
  Map<Id,Account> accMap = new Map<Id,Account>();
  
  for(Account a : alist){
    accMap.put(a.id,a);
  }
  
  
  for(Account_Salary__c asld: aslist){
        asld.salary__c = accMap.get(asld.account__c).Total_Salary__c;  
  }
  update aslist;
}