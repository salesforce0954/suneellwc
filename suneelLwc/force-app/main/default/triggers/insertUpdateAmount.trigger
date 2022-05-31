trigger insertUpdateAmount on Account (after update) {

    Map<Id,Account> mapAccount = new Map<Id,Account>();
    
    for(Account acc:Trigger.New){
      mapAccount.put(acc.id,acc);
    }
    
    List<Application__c> appList = [select Amount__c,Account__c from Application__c where Account__c =: mapAccount.keySet()];
    
    for(Application__c a:appList){
      a.Amount__c = mapAccount.get(a.account__c).Total_salary__c;
    }
    
    update appList;
}