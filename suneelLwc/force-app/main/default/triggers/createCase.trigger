trigger createCase on Contact (after insert,after update) {
 
  List<Case> caseList = new List<Case>();
  
  for(Contact con:Trigger.new){
  
     case c = new case();
     c.status = 'New';
     c.origin = 'Phone';
     c.contactId = con.id;
    caseList.add(c);
     
  
  }
  insert caseList;
    
}