public class insertAccount{
    
   public Account acc {get;set;}
   
   public insertAccount(){
     acc = new Account();
   }
   public pageReference save(){   
    insert acc;
    PageReference pageRef = new PageReference('/apex/createContact');
    pageRef.setRedirect(true);
    pageRef.getParameters().put('id',acc.id);
    return pageRef;
   }
}