trigger updatePhone on opportunity(after update,after insert){

     if(Trigger.isAfter){

            if(Trigger.isUpdate){
            set<Id> accountIds = new set<Id>();
            
            for(Opportunity opp:Trigger.New){
              accountIds.add(opp.accountId);
            }
            
            List<Account> accList = [select id,testPhoneAccount__c from Account where id=:accountIds];
            List<Contact> conList = [select accountId,testPhoneContact__c from Contact where accountId=:accountIds];
            
            Map<Id,Opportunity> mapOpp = new Map<Id,Opportunity>();
            
            for(Opportunity op: Trigger.New){
              mapOpp.put(op.accountId,op);
            }
            
            for(Account acc:accList){
            system.debug('Test Phone opp is '+mapOpp.get(acc.id).testPhoneOpportunity__c);
             acc.testPhoneAccount__c = mapOpp.get(acc.id).testPhoneOpportunity__c;
            }
            
            for(Contact con:conList){
            system.debug('Test Phone contact is '+mapOpp.get(con.accountId).testPhoneOpportunity__c);
             con.testPhoneContact__c = mapOpp.get(con.accountId).testPhoneOpportunity__c;
            }
            
            
            update accList;
            update conList;
    } 
    
        if(Trigger.isInsert || Trigger.isUpdate){
          List<Task> taskList = new List<Task>();
          for(Opportunity opList:Trigger.New){
           if(opList.stageName == 'Closed Won'){
          Task t = new Task();
             t.WhatId = opList.id;
             t.subject = 'Hi';
             taskList.add(t);
            }
          }
          upsert taskList;
        }
  }
   
    
}