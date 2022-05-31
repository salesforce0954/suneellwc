global class AccountBatchApex implements Database.Batchable<sObject>, Database.Stateful{
 
    global integer numberofDirectCustomers = 0;
 
    global Database.QueryLocator start(Database.BatchableContext bc){
 
        String soqlQuery = 'SELECT Name, AccountNumber, Type From Account';
 
        return Database.getQueryLocator(soqlQuery);
 
    }
 
     
 
    global void execute(Database.BatchableContext bc, List<Account> scope){
 
         
 
        for (Account acc : scope){
 
            if(acc.Type == 'Customer - Direct'){
               
               system.debug('Account type '+acc.Type);
                numberofDirectCustomers++;
 
            }
 
        }
 
    }
 
    global void finish(Database.BatchableContext bc){
              system.debug('No of customer direct '+numberofDirectCustomers);
    }
 
}