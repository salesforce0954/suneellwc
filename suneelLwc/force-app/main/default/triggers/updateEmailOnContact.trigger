trigger updateEmailOnContact on Account (after insert,after update) {
   //set<id> accountId = new set<id>();
   
   if((Trigger.isAfter &&(Trigger.isInsert || Trigger.isUpdate))){
        Map<Id,Account> mapAcc = new Map<Id,Account>();
       
       for(Account acc:Trigger.new){
         //accountId.add(acc.id);
         mapAcc.put(acc.id,acc);
       }
       
       List<contact> conList = [select email,accountid from contact where accountid =:mapAcc.keyset()];
       
       
       for(Contact c:conList){
         c.Email = mapAcc.get(c.accountId).Email__c;
       }
       
       update conList;
   }
   
}