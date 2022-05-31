trigger updatePAN on Application__c(before update){

/**set<Id> accountIds = new set<Id>();

for(Application__c app:Trigger.new){
  accountIds.add(app.Account__c);
}

List<Account> accList = [select pan_number__c from Account where id in : accountIds];

Map<Id,Account> mapApp = new Map<id,Account>();

for(Account a:accList){

 if(a.pan_number__c != null)
 
   mapApp.put(a.Id,a);

}

for(Application__c application:Trigger.New){

 
  application.pan_number__c = mapApp.get(application.Account__c).pan_number__c;

} */

    for(Application__c app:Trigger.new){
      list<Account> accList = [select pan_number__c from Account where id =: app.account__c limit 1];
      
      
      if(accList.size() > 0 ){
         app.pan_number__c = accList[0].pan_number__c;
      }
     
    }

  
    
    



}