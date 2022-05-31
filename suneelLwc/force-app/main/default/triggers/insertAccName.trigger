trigger insertAccName on Contact (after update) {

if(checkRecursive.run == true){

checkRecursive.run = false;
Map<Id,Contact> conMap = new Map<Id,Contact>();

  for(Contact c :Trigger.new){
    conMap.put(c.accountId,c);
  }  
  
  List<Account> accList = [select Total_salary__c from Account where id=:conMap.keySet()];
  
  
  
  for(Account a:accList){
    a.Total_Salary__c = conMap.get(a.Id).totalSales__c;
  }
  
  update accList;
  
  }
  
}