public class createContact{
  
  public contact con {get;set;}
  
  public createContact(){
    con = new contact();
  }
  
  public pageReference save(){
   con.accountId = ApexPages.currentPage().getParameters().get('Id');
   pageReference pageRef = new pageReference('/apex/showAccConRecords');
   pageRef.setRedirect(true);
   pageRef.getParameters().put('id',con.accountId);
   insert con;
   return pageRef;
  }
}