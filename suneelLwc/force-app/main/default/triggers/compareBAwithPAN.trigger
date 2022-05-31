trigger compareBAwithPAN on Account (before update,after update) {
   List<Application__c> applicationList;
   for(Account acc:Trigger.New){
    applicationList = [select pan_number__c from Application__c where pan_number__c =: acc.pan_number__c];
    
    
    if(Trigger.isBefore && Trigger.isUpdate){
     if(applicationList.size() > 0){
        acc.Site = 'Buddha Homes';        
     }
    }
     
     if(Trigger.isAfter && Trigger.isUpdate){
     if(applicationList.size() > 0){
     for(Application__c app: applicationList){
           app.Amount__c = 2000;
        }
      }
     update applicationList;
     }
     
   }
}