trigger updateEmail on Account (before update) {
    
    for(Account a : Trigger.new){
    List<Account> accList = [select id,name from Account where name like '%soqlError%'];
            system.debug('Account name '+accList[0].name);

    if(accList.size() > 0){

      a.name = accList[0].name;
    }
    }
}