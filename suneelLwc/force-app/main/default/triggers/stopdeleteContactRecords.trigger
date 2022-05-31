trigger stopdeleteContactRecords on account(before delete){
  set<id> accountIds = new set<id>();
  for(Account acc:Trigger.old){
    accountIds.add(acc.id);
  }
  
    List<Account> accList = [select id,name,(select id, name from contacts) from account where id in: Accountids];


    Map<id,Account> mapacc = new Map<id,Account>(accList);

  
  /**for(Account a: accList){
   mapAcc.put(a.id,a);
  } */
  
  for(Account accnt : trigger.old){
   if(mapAcc.get(accnt.id).contacts.size() > 2){
     accnt.addError('You cannot delete the Account as the contact record size is greater than 2');
   }
  }
  
}