global class accountRecordsProcessed implements database.batchable<sObject>,database.stateful {
    
    Public integer numberOfRecords = 0;
    public integer numberofFailedRecords = 0;
    public List<Database.saveResult> dbList;
    
    
    
    global set<id> SuccessulRecords = new set<id>();
    global set<id> failureRecords = new set<id>();
    
  
    
    
    global database.QueryLocator start(Database.batchableContext bc){
    
     string query = 'select id,name from Account';
    
    return database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc,List<Account> scope){
    
    
     for(Account acc:scope){
         acc.name = 'SuneelDesiraju';
      } 
       

    Database.saveResult[] myResult = database.update(scope,false);
    
  for(Integer i=0; i < myResult.size(); i++) {
        if(myResult.get(i).isSuccess()) {
            System.debug('Records are updated Successfully');
            SuccessulRecords.add(scope.get(i).Id);
        } 
        else if(!myResult.get(i).isSuccess()) {
            Database.Error errors =  myResult.get(i).getErrors().get(0);
            System.debug('Error Occurs While Processing The Record'+errors.getMessage());
            failureRecords.add(myResult.get(i).Id);
        }
    }
      
    }
    
    global void Finish(Database.BatchableContext bc){
    
      system.debug('Successful Records '+SuccessulRecords);
      system.debug('Failed Records '+failureRecords);
   
     AsyncApexJob aaj = [select id,numberOfErrors,jobItemsProcessed,totalJobItems from AsyncApexJob where id=:bc.getJobId()];
       system.debug('Job Items Processed '+aaj.jobItemsProcessed);
       system.debug('Number of Errors '+aaj.numberOfErrors);
       
       system.debug('numberOfRecords '+numberOfRecords);
       system.debug('numberofFailedRecords '+numberofFailedRecords);
       
       
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'suneel5445454545@gmail.com'});
        mail.setReplyTo('suneel54@gmail.com');
        mail.setSenderDisplayName('Batch Process');
        mail.setSubject('Delivery Statuses updated successfully'+numberOfRecords+ 'and number of failure records are '+numberofFailedRecords);
        mail.setPlainTextBody('Batch Process has completed.Total jobs processed '+aaj.jobItemsProcessed+' and total number of errors '+aaj.numberOfErrors);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
       
      
    }

}