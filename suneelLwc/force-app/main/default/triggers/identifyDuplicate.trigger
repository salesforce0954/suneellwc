trigger identifyDuplicate on Contact (before insert) {

   /** for(Contact c: Trigger.New){
     List<Contact> conList = [select id,phone,email from contact where phone=:c.phone and email=:c.email];
     
     if(conList.size() > 0){
       c.addError('Phone and Email already exists on another contact record');
     }
   } */
   
   

}