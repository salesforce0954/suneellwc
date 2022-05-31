trigger updateAccConPhone on Opportunity(after update){
  
    Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity>();
    
    for(Opportunity opp:Trigger.new){
      mapOpp.put(opp.accountId,opp);
    }
    
    List<Account> accList = [select TestPhoneAccount__c from Account where id=:mapOpp.keySet()];
    List<Contact> conList = [select accountId,TestPhoneContact__c from contact where accountId =:mapOpp.keySet()];
    
    for(Account a:accList){
      a.TestPhoneAccount__c = mapOpp.get(a.id).TestPhoneOpportunity__c;
    }
    
    for(Contact c:conList){
      c.TestPhoneContact__c = mapOpp.get(c.accountId).TestPhoneOpportunity__c;
    }
    
    update accList;
    update conList;
}