trigger checkEmail on Lead(before insert,before update){
  
      List<Contact> conList = [select id,Email from Contact];
      
      Map<String,Contact> mapContact = new Map<String,Contact>();
      
      for(Contact c:conList){
        mapContact.put(c.email,c);
      }
      
      for(Lead l:Trigger.new){
        if(mapContact.containsKey(l.Email)){
           l.addError('Email already exists on lead record');
        }
      }
      
      
  }