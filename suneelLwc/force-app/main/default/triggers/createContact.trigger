trigger createContact on Account (before insert,after insert) {
  
  if(Trigger.isAfter && Trigger.isInsert){
      List<Contact> conList = new List<Contact>();
        for(Account acc:Trigger.New){
            contact con = new contact();
            con.lastname = acc.Name;
            con.accountId = acc.Id;
            conList.add(con);
            system.debug('Contact :'+conList);
        }
        insert conList;
   }
   
   if(Trigger.isBefore && Trigger.isInsert){
      for(Account acc:Trigger.New){
      acc.NumberOfEmployees = 145;
      system.debug('Trigger 3'+acc.NumberOfEmployees);
      }
   }
   
}