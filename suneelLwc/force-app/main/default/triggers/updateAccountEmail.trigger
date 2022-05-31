trigger updateAccountEmail on Contact (after insert,after update) {
   //set<id> accountId = new set<id>();
   
   if((Trigger.isAfter &&(Trigger.isInsert || Trigger.isUpdate))){
     
     if(checkRecursive.run == true){
       checkRecursive.run = false;
       Map<id,contact> mapCon = new Map<id,contact>();
       
       for(Contact con:Trigger.new){
         // accountId.add(con.accountId);
          mapCon.put(con.accountId,con);
       }
       
       List<Account> accList = [select id,Name,Email__c from Account where id=:mapCon.keySet()];
       
       for(Account acc:accList){
         acc.Email__c = mapCon.get(acc.id).Email;
       }
       
       update accList;
      }
   }
}