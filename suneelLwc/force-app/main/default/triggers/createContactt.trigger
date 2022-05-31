trigger createContactt on Account(after insert){
  
  List<Contact> conList = new List<Contact>();
  
  for(Account acc:Trigger.New){
    contact c = new contact();
    c.accountId = acc.id;
    c.lastname = acc.name;
    conList.add(c);
  }
  insert conList;
}