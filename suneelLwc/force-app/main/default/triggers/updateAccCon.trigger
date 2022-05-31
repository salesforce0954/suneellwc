trigger updateAccCon on Account (after update,before update) {

  set<Id> accountId = new set<Id>();
  
  for(Account a:Trigger.New){
      accountId.add(a.id);
  }
  
  
  List<Contact> conList = [select Active__c,accountId,title,firstName,Department from Contact where accountId =: accountId];
  
  Map<String,Contact> mapCon = new Map<String,Contact>();
  
  for(contact con : conList){
    mapCon.put(con.firstName,con);
  }
  
  if(Trigger.isBefore && Trigger.isUpdate){
    for(Account acc:Trigger.new){
      if(mapcon.containsKey(acc.name)){
        acc.addError('Account name already exists');
      }else{
      acc.Name = acc.Name + 'add';
      }
    }
  }
  
  
  
  Map<Id,Account> mapAcc = new Map<Id,Account>();
  Map<String,Account> mapAccKey = new Map<String,Account>();
  
  for(Account aa:Trigger.New){
    mapAcc.put(aa.id,aa);
  }
  
  for(Account aa:Trigger.New){
    mapAccKey.put(aa.SLASerialNumber__c,aa);
  }
  
  if(Trigger.isAfter && Trigger.isUpdate){
      for(contact c:conList){
         c.Active__c = true;
         c.Department = mapAcc.get(c.accountId).Name;
         
         for(Account aaa:Trigger.New){
             if(mapAccKey.containsKey('2657')){
               c.title = mapAccKey.get(aaa.SLASerialNumber__c).SLASerialNumber__c;
             }
         }
      }
      
  }
  
  
  update conList;
}