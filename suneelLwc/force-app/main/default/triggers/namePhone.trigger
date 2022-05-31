trigger namePhone on Account(before update){
     
     for(Account acc:Trigger.New){
       if(acc.Phone != trigger.OldMap.get(acc.id).phone){
         acc.name = acc.name + acc.phone;
       }
     }
 }