trigger updateAppAmount on Account(after update){

   Map<id,account> mapAcc = new Map<id,account>();
   
   for(Account acc:Trigger.new){
      mapAcc.put(acc.id,acc);
   }
   List<Application__c> appList = [select Amount__c,Account__c from Application__c where Account__c=:mapAcc.keySet()];
   
   for(Application__c app:appList){
     app.Amount__c = mapAcc.get(app.Account__c).Total_salary__c;
   }
   
   update appList;
}