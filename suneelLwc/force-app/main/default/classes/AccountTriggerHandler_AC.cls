Public class AccountTriggerHandler_AC

{

   public static void processAccountData(){

 //deserialize the JSON to the Account List
    
    List<Account> accLst = [select id,Name from Account];
    String jsonString = json.serialize(accLst);
    system.debug(jsonString);
    
    JsonParser parser = json.createParser(jsonString);
    
    system.debug(parser.getCurrentToken());
    
    while(parser.nextToken() != null){
      if((parser.getCurrentToken() == JSONTOKEN.FIELD_NAME) && parser.getText() == 'testOne'){
        system.debug('Get Text '+parser.getText());
      }
    }

      List<Account> accountList = (List<Account>)Json.deserialize(jsonString,List<Account>.class);

//Printing the Account List

System.debug('---Account List---'+accountList);

   }
   }