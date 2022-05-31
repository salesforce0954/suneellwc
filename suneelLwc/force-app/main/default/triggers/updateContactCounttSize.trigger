trigger updateContactCounttSize on contact (after insert,after delete,after update,after undelete) {

  /** set<id> accountIds = new set<id>();
  
  for(Contact con:Trigger.new){
    accountIds.add(con.id);
  }
  
  for(Contact con:Trigger.old){
    accountIds.add(con.id);
  }
  
  
  List<Account> acc = [Select id, NoofContacts__c,(Select id from Contacts) from Account where id IN: accountIds];
        if(acc!=null){
        for(Account accValue:acc){
            accValue.Total_Active_Contacts__c = accValue.Contacts.size();
        } 
        }
        if(!acc.isempty()){
        update acc;
        } */
        
       if(Trigger.isinsert || Trigger.isupdate || trigger.isdelete || Trigger.isundelete){
           rollupSummaryHandler.getContactSize(Trigger.New,Trigger.Old);
        }
  

}