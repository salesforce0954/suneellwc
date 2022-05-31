trigger updateCityPan on Account (before update) {
  
  for(Account acc:Trigger.new){
    List<Application__c> appList = [select Pan_Number__c,account__c from Application__c where Pan_number__c =: acc.Pan_number__c];
    if(appList.size() > 0){
      acc.city__c = 'Hyderabad';
    }
    
  }
}