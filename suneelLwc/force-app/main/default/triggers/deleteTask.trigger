trigger deleteTask on Task (before delete) {

  User u = [select name,profileId from User where profileid='00e5e000002oVXTAA2'];
  
  for(Task t:Trigger.old){
   
   if(u.profileId == '00e5e000002oVXTAA2'){
     t.addError('Only system admin can delete the task');
   }
  
  }

}