trigger checkEmailAccount on Applicant__c(before insert,before update){

      /**  for(Applicant__c app: Trigger.New){
   
    List<Account> accList = [select id,email__c,name from Account where email__c =:app.email__c limit 1];
    
         if(accList.size() > 0){
             if(app.email__c == accList[0].email__c){
               app.account__c = accList[0].id;
               
            }
            }
    } */
    
    List<Account> accList = [select id,email__c from Account];
    
    Map<String,Account> accMap = new Map<String,Account>();
    
    for(Account acc:accList){
      accMap.put(acc.email__c,acc);
    }
    
    for(Applicant__c app:Trigger.New){
      if(accMap.containsKey(app.email__c)){
         app.Account__c = accMap.get(app.Account__r.email__c).id;
      }
    
    }
    
    }