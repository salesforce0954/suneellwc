trigger assignAccountPAN on Application__c (before insert,before update) {

 /** Map<Id,String> mapApp = new Map<Id,String>();
  
  
  
  for(Application__c app:Trigger.New){
     mapApp.put(app.account__c,app.Pan_number__c);
  }
  
  List<Account> accList = [select pan_number__c from Account where pan_number__c =: mapApp.values()];
  
  Map<string,id> accMap = new Map<string,id>();
  
  for(Account acc:accList){
    accMap.put(acc.Pan_number__c,acc.id);
  }
  
  for(Application__c a : Trigger.new){
  
      if(accMap.containsKey(a.pan_number__c)){
          a.account__c = accMap.get(a.pan_number__c);
      }
  
  } */
  
  for(Application__c app:Trigger.new){
     List<Account> acc = [select pan_number__c from account where pan_number__c =:app.pan_number__c limit 1];
     
     if (acc.size() > 0){
      
        if(app.pan_number__c == acc[0].pan_number__c){
          app.account__c = acc[0].id;
        }
     
     }
  }

}