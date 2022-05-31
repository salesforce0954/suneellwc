trigger duplicatePANumber on Account (before insert) {
   
    //set<String> dupPan = new set<String>();
    Map<id,string> dupMap = new Map<id,string>();
    
    for(Account acc:Trigger.New){
       //dupPan.add(acc.pan_number__c);
       dupMap.put(acc.id,acc.pan_number__c);
    }
    system.debug('Map Values '+dupMap.values());
    List<Application__c> appList = [select pan_number__c,account__c from Application__c where Pan_number__c in : dupMap.values()];
    system.debug('size '+appList.size());
    
     for(Account acc:Trigger.new){
        if(appList.size() > 0){
          acc.addError('Duplication PAN number in application record');
        }
     }
}