trigger updateAccFields on Account_Salary__c (after insert,after update,after delete) {

     set<Id> accountSalIds = new set<Id>();
     
     for(Account_Salary__c  asal:Trigger.New){
        accountSalIds.add(asal.account__c);
     }
     
     List<Account_Salary__c> alist = [select Name__c,Salary__c from Account_Salary__c where Account__c =: accountSalIds];
     List<Account> accList = [select Total_salary__c,Max_salary__c from Account where id=:accountSalIds];
    
     
     for(Account acc:accList){
       for(Account_Salary__c asal:alist){
       acc.Total_salary__c = asal.Salary__c;
       acc.Max_salary__c = asal.Salary__c;
       }
     }
     upsert accList;
  

}