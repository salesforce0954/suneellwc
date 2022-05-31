trigger preventCreateContact on Contact (before insert) {

   set<id> accountIds = new set<id>();
   
   for(contact c : Trigger.New){
      accountIds.add(c.accountId);
   }
   
   List<Account> accList = [select id,name,(select id,lastName from contacts) from Account where id in: accountIds limit 1];
 /*  system.debug('Size of account '+accList);
   
   Map<Id,Account> mapAcc = new Map<id,Account>();
   for(Account a:accList){
     mapAcc.put(a.id,a);
   } */
   
   for(contact con:Trigger.New){
     //if(mapAcc.get(con.accountId).contacts.size() > 1){
     if(accList[0].contacts.size() > 1){
       con.addError('sorry you cannot create the contact size the size of the related account is one');
     }
   }
}