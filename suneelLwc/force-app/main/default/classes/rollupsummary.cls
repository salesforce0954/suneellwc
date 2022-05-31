public class rollupsummary{
   
     public static void rolluponaccount(List<Contact> newCon,List<contact> oldCon){
     
         set<id> accountIds = new set<id>();
         
         for(Contact ncon:newCon){
           accountIds.add(ncon.accountId);
         }
         
         for(Contact ocon:oldCon){
           accountIds.add(ocon.accountId);
         }
         
         List<Contact> storeUndel = new List<Contact>();
      
          for(Contact c:[select id,lastName from contact where id in :trigger.new]){
              system.debug('Last Name '+c.lastName);
                c.lastName = c.lastName + 'restored';
                storeUndel.add(c);
              system.debug('Size '+storeUndel.size());
          }
      
          update storeUndel;
         
        List<Account> accList = [select id,name,noOfContacts__c,(select id from contacts) from Account where id=:accountIds];
        
         for(Account acc:accList){
             acc.noOfContacts__c = acc.contacts.size();
         }
          
          update accList;

         
         
     }
}