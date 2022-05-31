trigger triggerBatchClass on Contact (after insert) {
  
      Map<id,contact> mapContact = new Map<id,contact>();

  for(contact c:Trigger.New){
    mapContact.put(c.id,c);
    
  }
  
  showContactRecords scr = new showContactRecords(mapContact);
  database.executeBatch(scr);

}