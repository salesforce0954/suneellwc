public class firstBatchClass implements Database.Batchable<sobject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select id,name from Lead';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Lead> scope){
        for(Lead ld:scope){
            ld.Rating = 'cold';            
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        
    }
}