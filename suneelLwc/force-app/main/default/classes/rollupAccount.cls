public class rollupAccount{

  public static void numberOfContacts(List<Contact> newList,List<Contact> oldList){
     
     system.debug('is Trigger Executing '+Trigger.isExecuting);
     set<id> accountIds = new set<id>();
    
    if(newList != null){
     for(contact con:newList){
        accountIds.add(con.accountId);
     }
    } 
   
   if(oldList != null){
     for(contact c:oldList){
       accountIds.add(c.accountId);
     }
    }
     
   List<Account> accList = [select id,name,noOfContacts__c,(select id,accountId from contacts) from Account where id in :accountIds];
   
   for(Account acc:accList){
        acc.noOfContacts__c = acc.contacts.size();
     }
     
     upsert accList;
     
     
  }

}