trigger duplicatePAN on Application__c (before insert) {
  
   set<string> pandup = new set<string>();
   
   for(Application__c app:Trigger.new){
      pandup.add(app.pan_number__c);
   }
   
   List<Application__c> appList = [select id,name from Application__c where pan_number__c =: pandup];
   
   for(Application__c a :Trigger.new){
       if(appList.size() > 0){
          a.addError('Duplicate PAN number exists in other application');
       }
   }
}