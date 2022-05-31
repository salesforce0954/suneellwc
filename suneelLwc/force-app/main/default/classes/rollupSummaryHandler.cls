public class rollupSummaryHandler{

   public static void getContactSize(List<contact> newList,List<Contact> oldList){
   
       set<id> accountId = new set<id>();
       
       if(newList != null){
           for(Contact cNew:newList){
              accountId.add(cNew.accountId);
           }
       }
       
       if(oldList != null){
           for(Contact cOld:oldList){
              accountId.add(cOld.accountId);
           }
        }
       
       List<Account> accList = [select id,noOfContacts__c,(select id,accountId from contacts) from Account where id in : accountId];
       
       for(Account a: accList){
         a.noOfContacts__c = a.contacts.size();
       }
       update accList;
   
   }

}