trigger updateAccountSales on contact (after update){

  Map<id,contact> mapContact = new Map<id,contact>();
  
  for(contact con:Trigger.new){
     if(con.accountId != null){
        mapContact.put(con.accountId,con);
     }
  
  }
  
  
  List<Account> accList = [select average__c,(select totalSales__c from contacts ) from Account where id=:mapContact.keySet()];
  
  
  for(Account acc: accList){
  
    integer conSize = acc.contacts.size();
    system.debug('size of contact '+conSize);
    
    if(acc.average__c != null){
    acc.average__c = (acc.average__c + mapContact.get(acc.id).totalSales__c ) /conSize;
    }
  
  }
  if(accList.size() > 0){
  
  update accList;
  
  }

}