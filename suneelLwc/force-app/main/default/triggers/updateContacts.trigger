trigger updateContacts on Account (after update) {
  /** set<id> accountId = new set<id>();
   
   for(Account acc:Trigger.new){
     accountId.add(acc.id);
   }
   
   List<Contact> conList = [select noOfContacts__c,accountId,Email from contact where accountId in :accountId];
   
   Map<String,Contact> conMap = new Map<String,Contact>();
   
   
   
   Map<Id,Account> mapAcc = new Map<Id,Account>();
   
   for(Account a:Trigger.new){
     mapAcc.put(a.id,a);
   }
   
   for(Contact c:conList){
    conMap.put(c.email,c);
     if(conMap.containsKey(mapAcc.get(c.accountId).Email__c)){
    c.noOfContacts__c = mapAcc.get(c.accountId).NumberofLocations__c;
    }
   } 
   update conList; */
   List<Contact> conList;
   for(Account a:Trigger.new){
     conList  = [select noOfContacts__c,accountId,Email from contact where email =:a.email__c limit 1];
     
     if(conList.size() > 0){
       if(a.email__c == conList[0].email){
           conList[0].noOfContacts__c = a.NumberOfLocations__c;
       }
     }
   }
   update conList;
}