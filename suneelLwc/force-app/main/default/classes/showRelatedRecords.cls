public class showRelatedRecords{

    public showRelatedRecords() {

    }

  
  public Account acc {get;set;}
  
  public Account accnt {get;set;}
  
  public List<Contact> conList {get;set;}
  
  public showRelatedRecords(ApexPages.StandardController controller){
    
     acc = (Account)controller.getRecord();
     
     accnt = [select id,name from Account where id=:acc.id];
     
     conList = [select id,name from Contact where accountId =:acc.id];
  }
  
  public pageReference newContact(){
   
   pageReference pageRef = new pageReference('/apex/contactForm?accountId='+accnt.id);
   return pageRef;
  }
}