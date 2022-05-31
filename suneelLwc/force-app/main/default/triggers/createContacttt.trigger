trigger createContacttt on contact(before insert){

   set<Id> accountIds = new set<id>();
   
   for(Contact conList : Trigger.New){
     accountIds.add(conList.accountId);
   }
   
   List<Account> accList = [select id,phone from Account where id=:accountids];
   
   Map<Id,Account> accMap = new Map<Id,Account>();
   
   for(Account acc:accList){
   
      accMap.put(acc.id,acc);
   }
   
   for(Contact con: Trigger.New){
     con.otherPhone = accMap.get(con.accountId).phone;
   }

}