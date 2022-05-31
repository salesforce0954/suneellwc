trigger addAccPhone on contact(before insert){
         
         set<id> accountids = new set<id>();
         
         for(contact a : Trigger.New){
           accountids.add(a.accountId);
         }
         
         List<Account> accList = [select id,Name,Phone from Account where Id in :accountids];
         
    /**     for(Account a : accList){
             for(contact c : Trigger.New){
               c.otherPhone = a.phone;
             }
         } */
         
         
          Map<id,Account> mapAcc = new Map<id,Account>(accList);
         
        /** for(Account a: accList){
           mapAcc.put(a.id,a);           
         } */
        
         for(Contact c : Trigger.New){ 
          c.otherPhone = mapAcc.get(c.accountId).Phone;
         }
        
       
        }