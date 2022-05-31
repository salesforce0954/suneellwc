trigger updateAccTotalSal on Application__c (after insert,after update) {

   
   Map<id,Application__c> mapApp = new Map<id,Application__c>();
   
   for(Application__c app:Trigger.new){
      mapApp.put(app.account__c,app);
   }
      
   
   List<Account> accList = [select Total_salary__c from Account where id=:mapApp.keySet()];
   
   for(Account a : accList){
     a.Total_salary__c = mapApp.get(a.id).Amount__c;
   }
   
   upsert accList;
}