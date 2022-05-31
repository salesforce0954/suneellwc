trigger updateAccPan on Application__c (before insert,before update) {
   Map<String,Application__c> mapAcc = new Map<String,Application__c>();
   
   for(Application__c app:Trigger.New){
     mapAcc.put(app.Pan_Number__c,app);
   }
   
   List<Account> accList = [select Pan_number__c from Account where Pan_number__c =: mapAcc.keySet()];
   system.debug('Account size '+accList.size());
   system.debug('Pan Number '+accList[0].Pan_number__c);
   
   Map<String,Id> mapAccount = new Map<String,Id>();
   
   for(Account acc : accList){
      mapAccount.put(acc.pan_number__c,acc.id);
   }
   
   if(accList.size() > 0 ){
   
       for(Application__c app:Trigger.New){
          system.debug('Map Account '+mapAccount.get(app.pan_number__c));

          app.Account__c = mapAccount.get(app.pan_number__c);
       }
       
   }
   
   
}