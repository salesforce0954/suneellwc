trigger updateOtherPhone on Contact (before insert,before update) {

   set<Id> accountIds = new set<Id>();
   for(Contact con: Trigger.new){
      accountIds.add(con.accountId);
   }
   
   List<Account> accList = [select id,Phone,Name from Account where id = :accountIds];
   Map<Id,Account> mapAcc = new Map<Id,Account>();
   
   for(Account acc:accList){
     mapAcc.put(acc.Id, acc);
   }
   
   for(Contact cont : Trigger.new){
     if(cont.accountId != null){
       cont.otherPhone = mapAcc.get(cont.accountId).phone;
     }
   }

}