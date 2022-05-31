public class paginationExample{

  Public List<Account> accList {get;set;}
  public integer offsetSize = 0;
  public integer limitSize = 10;
  
  public boolean disableButton {get;set;}
  

  public paginationExample(){
        
    disableButton = false;
     
  }
  
  public List<Account> getAccounts(){   
    accList = [select id,Name from Account order by Name limit :limitSize offset :offsetSize]; 
    return accList;
  }
  
  public void firstPage(){
    offsetSize = 0;
  }
   
  public void previous()
  {
    offsetSize = offsetSize - limitSize;
  }
  
  public void next()
  {
   offsetSize =  offsetSize + limitSize;
  }
  
  public boolean getDisable(){
    if(offsetSize == 0){
      disableButton = true;
    }else{
     disableButton = false;
    }
    return disableButton;
  }

}