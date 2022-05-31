trigger countCountactOnAccount on Contact (after insert,after update,after delete,after undelete) {
   
   set<id> accountId = new set<id>();
   List<Contact> storeUndel;
   
   
   if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){

      
      for(Contact c:Trigger.new){
        accountId.add(c.accountId);
      }
      
   }
   
    if(Trigger.isAfter && Trigger.isDelete){

      
      for(Contact c:Trigger.old){
        c.lastName = c.lastName +'restored';
      }
      
   }
   
   if(Trigger.isAfter && Trigger.isUndelete){

      storeUndel = new List<Contact>();
      
      for(Contact c:[select id,lastName from contact where id in :trigger.new]){
      system.debug('Last Name '+c.lastName);
        c.lastName = c.lastName + 'restored';
        storeUndel.add(c);
      system.debug('Size '+storeUndel.size());
      }
      
      update storeUndel;
      
   }
   
   List<Account> accList = [select id,name,noOfContacts__c,(select id from contacts) from Account where id=:accountId];
   
  for(Account acc:accList){
     acc.noOfContacts__c = acc.contacts.size();
  }
  
  update accList;
      
}