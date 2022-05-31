trigger assignAccPaN on Application__c (before insert,before update) {
  
    set<string> accountIds = new set<string>();
    
    //Map<id,integer> searchPan = new Map<id,integer>();
    Map<string,id> searchPan = new Map<string,id>();
    
    for(Application__c app:Trigger.New){
      accountIds.add(app.pan_number__c);
    }
    
    List<Account> accList = [select id,name,Pan_number__c from Account where pan_number__c = :accountIds];
    
    
    for(Account acc:accList){
      system.debug('PAN Number '+acc.Pan_number__c);
      if(acc.Pan_number__c != 'BLF1245666'){
      system.debug('No');
      }else{
      system.debug('Yes');
      }
      searchPan.put(acc.Pan_Number__c,acc.id);
      system.debug('searchPan '+searchPan);
    }
    
    for(Application__c a : trigger.new){
      if(searchPan.containsKey(a.Pan_Number__c)){
        system.debug('entered');
         a.account__c = searchPan.get(a.Pan_Number__c);
      }
    } 
    
 /**   for(Application__c app:Trigger.new){
      List<Account> accList = [select id,name,Pan_number__c from Account where pan_number__c =: app.Pan_number__c limit 1];
      if(accList.size() > 0){
         if(app.Pan_Number__c == accList[0].pan_number__c){
           app.account__c = accList[0].id;
         }
      }
    } */
    
}