trigger rollbackRecord on Account (after undelete) {

   List<Account> accList = new List<Account>();
   for(Account acc:[select id,name from Account where id in : Trigger.new]){
      acc.name = acc.name+'reverted';
      accList.add(acc);
   }
   update accList;
}