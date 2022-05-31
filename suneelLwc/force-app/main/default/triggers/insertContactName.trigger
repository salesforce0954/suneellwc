trigger insertContactName on Account (after insert) {
  
  
  List<Contact> conList = new List<Contact>();
  
  for(Account acc:Trigger.new){
     Contact c = new Contact();
     c.lastName = acc.name; 
     conList.add(c);
  }
  insert conList;
}