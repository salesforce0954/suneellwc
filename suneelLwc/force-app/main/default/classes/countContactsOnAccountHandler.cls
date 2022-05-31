public class countContactsOnAccountHandler{
   public static void countContacts(List<Contact> newContact,List<Contact> oldContact){
     
      set<id> accountIds = new set<id>();
    
    if(newContact != null){
            for(Contact con : newContact){
              accountIds.add(con.accountId);
            }
    }
    
    if(oldContact != null){
        for(contact con1: oldContact){
          accountIds.add(con1.accountId);
        }
    }
    
    List<Account> accList = [select id,name,noOfContacts__c,(select accountId from contacts) from Account where id =:accountIds];
    
    for(Account acc:accList){
      acc.noOfContacts__c = acc.contacts.size();
    }
    update accList;
   }
}