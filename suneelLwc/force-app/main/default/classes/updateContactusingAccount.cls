public class updateContactusingAccount implements database.batchable<sObject>,database.stateful{

   set<id> successAcc = new set<id>();
   set<id> failureAcc = new set<id>();
   
   set<id> successApplication = new set<id>();
   set<id> failureApplication = new set<id>();
   
   public integer numberOfSuccessfulAccounts = 0;
   public integer numberOfSuccessfulApplications = 0;
   
   public integer numberOfFailureAccounts = 0;
   public integer numberOfFailureApplications = 0;
   
   

   public database.queryLocator start(Database.batchableContext bc){
   
     system.enqueueJob(new queueableExample());
     string query = 'select id,AnnualRevenue,Pan_Number__c,(select pan_number__c,account__c from Application__r) from Account';
     return database.getqueryLocator(query);
   }
   
   public void execute(Database.batchableContext bc,List<Account> scope){
   
     List<Account> accList = new List<Account>();
     List<Application__c> applicationList = new List<Application__c>();
     
     for(Account acc:scope){
        for(Application__c app:acc.Application__r){
          if(acc.Pan_Number__c == app.Pan_Number__c){
             acc.AnnualRevenue = 1000;
             app.Amount__c = 1000;
          }
          accList.add(acc);
          applicationList.add(app);
        }
     }
     
     List<Database.saveResult> srAcc = database.update(accList,false);
     List<Database.saveResult> srApp = database.update(applicationList,false);
     
     //Account
     for(Database.saveResult sr:srAcc){
        if(sr.isSuccess()){
          
            successAcc.add(sr.getId());
            numberOfSuccessfulAccounts++;
        }else{
                for(Database.error err: sr.getErrors()){
                }
            failureAcc.add(sr.getId());
            numberOfFailureAccounts++;
        }
        
     
     }
     
     //Application
     for(Database.saveResult sr:srApp){
        if(sr.isSuccess()){
           successApplication.add(sr.getId());
           numberOfSuccessfulApplications++;
        }else{
                for(Database.error err: sr.getErrors()){
                  System.debug('The following error has occurred.');                    
                  System.debug(err.getStatusCode() + ': ' + err.getMessage());
                  system.debug('Get error fields '+err.getFields());
                }
           failureApplication.add(sr.getId());
           numberOfFailureApplications++;
        }
        
     
     }
     
   }
   
   public void finish(Database.batchableContext bc){
   
         //system.debug('is Future ? '+system.isFuture());
         //system.debug('is Batch ? '+system.isBatch());
         
         
         AsyncApexJob aaj = [select id,Status,NumberOfErrors,JobItemsProcessed,TotalJobItems from AsyncApexJob where id=:bc.getJobId()];
         
         system.debug('Total successful Accounts '+numberOfSuccessfulAccounts);
         system.debug('Total successful applications '+numberOfSuccessfulApplications);
         system.debug('NumberOfErrors '+aaj.NumberOfErrors);
         system.debug('JobItemsProcessed '+aaj.JobItemsProcessed);
         system.debug('Status '+aaj.Status);
         system.debug('TotalJobItems '+aaj.TotalJobItems);
         Messaging.singleEmailMessage msm = new Messaging.singleEmailMessage();
         List<String> addresses = new List<String>{'suneel54@gmail.com'};
         msm.setToAddresses(addresses);
         msm.setSubject('Total Successul for the Account'+numberOfSuccessfulAccounts +'Total successful for the Application '+numberOfSuccessfulApplications + ' Failures for the application is '+numberOfFailureApplications + 'Failures for the account is '+numberOfFailureAccounts );
         msm.setPlainTextBody('Total Successul Record ids for the Account'+successAcc+'Total successful record ids from the Application '+successApplication+ ' Failures of Id for the application is '+failureApplication + 'Failure of id for the account is '+failureAcc);
         Messaging.sendEmail(new Messaging.singleEmailMessage[] {msm});
   }
}