trigger duplicateAccPAN on Application__c (before insert) {
  set<string> dupPan = new set<string>();
  set<id> dupId = new set<id>();
  
  Map<id,string> mapPan = new Map<id,string>();
  
  
  for(Application__c app:Trigger.new){
    //dupPan.add(app.pan_number__c);
    //dupId.add(app.account__c);
    
    mapPan.put(app.account__c,app.pan_number__c);
  }
  //system.debug('Pan '+dupPan);
 // system.debug('id '+dupId);
  List<Account> accList = [select id,pan_number__c from Account where pan_number__c =: mapPan.values() and id =: mapPan.keyset()];
      system.debug('size '+accList.size());

  
  for(Application__c a:Trigger.new){
    if(accList.size() > 0){
      a.addError('Duplication PAN ');
    }
  }
}