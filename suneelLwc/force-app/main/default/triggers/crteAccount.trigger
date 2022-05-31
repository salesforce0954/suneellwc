trigger crteAccount on Account (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
      
      if(accountInsert.isRec == true){
      accountInsert.isRec = false;
       accountInsert.insertAcc();
       
       }
    }
}