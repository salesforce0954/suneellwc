trigger calculateAvg on Contact (after update) {

   set<Id> accountId = new set<Id>();
   
   for(Contact c:Trigger.new){
     accountId.add(c.accountId);
   }
   
   List<Account> accList = [select average__c,(select totalSales__c,accountId from contacts) from Account where id=:accountId];
   system.debug('Size of Account '+accList.size());
   
   Map<Id,Contact> conMap = new Map<Id,Contact>();
   
   for(Contact con:Trigger.new){
     conMap.put(con.accountId,con);
   }
   
   if(accList.size()>0){
      for(Account acc:accList){
        system.debug('Contact size '+acc.contacts.size());
        //system.debug('Total Sales '+conMap.get(acc.id).totalSales__c);
        if(acc.average__c != null){
         acc.average__c = (acc.average__c + conMap.get(acc.id).totalSales__c)/acc.contacts.size();
         }
           
          
      
      }
  }
  
  update accList;
   
   

}