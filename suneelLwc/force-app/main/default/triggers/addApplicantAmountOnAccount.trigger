trigger addApplicantAmountOnAccount on Applicant__c (after insert,after update) {

  set<Id> accountIds = new set<Id>();
  
  for(Applicant__c app:Trigger.new){
    accountIds.add(app.account__c);
  }
  
  List<Account> accList = [select Total_Salary__c from Account where id=:accountIds];
  
  Map<id,Applicant__c> appMap = new Map<id,Applicant__c>();
  
  for(Applicant__c a:Trigger.new){
    appMap.put(a.account__c,a);
  }
  
  for(Account acc:accList){
  
    acc.Total_Salary__c += appMap.get(acc.id).Amount__c;
  }
  
  update accList;
}