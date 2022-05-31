trigger insertContactRecord on Account(after insert,after update){

 if(Trigger.isAfter && Trigger.isUpdate){ 
  Map<Id,Account> mapa = new Map<Id,Account>();
  
  for(Account ac : Trigger.New){
    mapa.put(ac.id,ac);
  }
  
  List<Contact> cList = [select otherphone__c,AccountId,lastName from Contact where accountId =: mapa.keySet()];
  
  for(Contact c: cList){
     c.otherphone__c = mapa.get(c.accountId).testPhoneAccount__c;
  }
  
  update cList;
  
  }
  
  List<Contact> conList = new List<Contact>();
  
  if(Trigger.isAfter && Trigger.isInsert){  
   for(Account acc:Trigger.new){
       contact c = new contact();
       c.accountId = acc.id;
       c.lastName = acc.name;
       conList.add(c);
   }
   
   if(conList.size() > 0){
   insert conList;
   }
   
   }
}