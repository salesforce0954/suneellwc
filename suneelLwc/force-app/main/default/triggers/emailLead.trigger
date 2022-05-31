trigger emailLead on Lead (before insert,before update) {

    List<contact> conList = [select email from contact];
    Map<string,contact> mapCon = new Map<string,contact>();
    
    for(contact cont:conList){
      mapCon.put(cont.email,cont);
    }
    
    for(Lead ld:trigger.new){
      if(mapCon.containsKey(ld.email)){
        ld.addError('Email already exists');
      }
    }
    
  /**  for(contact con : conList){
      for(Lead ld : Trigger.New){
          if(ld.email.equals(con.email)){
            ld.addError('Email already exists');
          }
      }
    } */

}