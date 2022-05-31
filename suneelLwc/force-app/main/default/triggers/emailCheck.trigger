trigger emailCheck on Lead (before insert,before update) {
  
  
  List<Contact> conList = [select email from contact];
  Map<string,Contact> mapCon = new Map<string,Contact>();
 
  
  for(Contact con:conList){
    mapCon.put(con.email,con);
  }

  for(Lead l:Trigger.New){
     if(mapCon.containsKey(l.email)){
       l.addError('Email alreadys in the contact record');
      }
     }
  }