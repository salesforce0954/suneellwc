public class showContactOppRelatedRecords{

   public Account accList {get;set;}
   public List<Opportunity> oppList {get;set;}
   public List<Contact> conList {get;set;}
   Account acc;
  public showContactOppRelatedRecords(){

  }

  public List<Contact> getcontactRecords(){
    acc= new Account();
    conList = [select id,Name from contact where accountId =: acc.id];
    return conList;
  }
  
   public List<opportunity> getopportunityRecords(){
   acc= new Account();
    oppList = [select id,Name from opportunity where accountId =: acc.id];
    return oppList;
  }
}