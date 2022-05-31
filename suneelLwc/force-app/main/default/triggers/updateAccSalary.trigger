trigger updateAccSalary on Application__c (after update,before update) {
  
   Map<id,Application__c> appMap = new Map<id,Application__c>();
   
   for(Application__c app:Trigger.new){
          appMap.put(app.account__c,app);
       }

  if(Trigger.isUpdate && Trigger.isAfter){
  
       
       List<Account> accList = [select Total_salary__c from Account where id=:appMap.keySet()];
       system.debug('Account id '+accList[0].id);
       
       for(Account a:accList){
          
            a.Total_salary__c = appMap.get(a.id).Amount__c;
       }
       update accList;
   
   }
   
   if(Trigger.isBefore && Trigger.isUpdate){
     
      List<Account> accList = [select pan_number__c,id from Account where id=:appMap.keySet()];
      
      Map<id,account> accMap = new Map<id,account>();
      
      for(Account a:accList){
        accMap.put(a.id,a);
      }
      
      for(Application__c app:Trigger.new){
        app.Pan_Number__c = accMap.get(app.Account__c).pan_number__c;
        system.debug('Pan number '+app.pan_number__c);
      }
      
   }
   
}