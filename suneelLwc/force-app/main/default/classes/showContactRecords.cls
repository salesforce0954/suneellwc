global class showContactRecords implements database.batchable<sObject> {
  Map<Id,Contact> mapCon = new Map<Id,Contact>();
  global showContactRecords(Map<Id,contact> contactMap){
    mapcon = contactMap;
  }
  global database.queryLocator start(Database.batchableContext bc){
     return Database.getQueryLocator([SELECT id,Name,email,phone from contact where id in:mapcon.keySet()]);
  }
  global Void execute(Database.batchableContext bc,List<Contact> scope){
    for(Contact c:scope){
       system.debug('ID :'+c.id);
       system.debug('Name :'+c.name);
       system.debug('Email :'+c.email);
       system.debug('Phone :'+c.phone);
    }
  }
  global void finish(database.batchableContext bc){
     system.debug('Porcessed the contact records');
  }
}