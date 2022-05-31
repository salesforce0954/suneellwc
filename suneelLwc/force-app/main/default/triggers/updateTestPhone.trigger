trigger updateTestPhone on Opportunity(after update){
 
   set<Id> accountIds = new set<Id>();
   
   for(Opportunity opp:Trigger.New){
     accountIds.add(opp.accountId);
   }
   
   List<Account> accList = [select TestPhoneAccount__c from Account where id=:accountIds];
   List<Contact> conList = [select testPhoneContact__c,accountId from Contact where accountId=:accountIds];
   
   Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity>();
   
   for(Opportunity op: Trigger.New){
    mapOpp.put(op.accountId,op);
   }
   
   for(Account acc:accList){
     acc.TestPhoneAccount__c = mapOpp.get(acc.id).TestPhoneOpportunity__c;
   }
   
    for(Contact con:conList){
     con.testPhoneContact__c = mapOpp.get(con.accountId).TestPhoneOpportunity__c;
   }
   
   update accList;
   update conList;
}