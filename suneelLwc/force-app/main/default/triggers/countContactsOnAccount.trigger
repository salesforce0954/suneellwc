trigger countContactsOnAccount on Contact (after insert,after update,after delete) {
   
    set<id> accountIds = new set<id>();
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
            for(Contact con : Trigger.New){
              accountIds.add(con.accountId);
            }
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        for(contact con1: Trigger.Old){
          accountIds.add(con1.accountId);
        }
    }
    
    List<Account> accList = [select id,name,noOfContacts__c,(select accountId from contacts) from Account where id =:accountIds];
    
    for(Account acc:accList){
      acc.noOfContacts__c = acc.contacts.size();
    }
    update accList; 
    
    //countContactsOnAccountHandler.countContacts(Trigger.new,Trigger.old);
}