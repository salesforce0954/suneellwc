trigger preventtDelete on Application__c (after undelete) {
   
   List<Application__c> a = new List<Application__c>();
   
   for(Application__c acc : [select id,amount__c from Application__c where id in :Trigger.new]){
       acc.Amount__c = 50000;
       a.add(acc);      
   }
   update a;
}