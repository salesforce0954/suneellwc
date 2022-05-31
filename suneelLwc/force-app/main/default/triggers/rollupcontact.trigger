trigger rollupcontact on Contact (after insert,after update,after delete) {
   
   /** set<id> accountId = new set<id>();
    if(Trigger.isInsert || Trigger.isUpdate){
         for(contact c:Trigger.new){
           accountId.add(c.accountId);
         }
     }
     if(Trigger.isDelete){
         for(contact c1:Trigger.old){
           accountId.add(c1.accountId);
         }
     }
     List<Account> accList = [select id,name,noOfContacts__c,(select id,accountId from contacts) from Account where id in :accountId];
     
     for(Account acc:accList){
        acc.noOfContacts__c = acc.contacts.size();
     }
     
     upsert accList; */
     
     rollupAccount.numberOfContacts(Trigger.new,Trigger.old);
    
     
}