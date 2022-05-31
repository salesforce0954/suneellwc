@RestResource(urlMapping='/accountRetreive')
global class sendAccountInformation{

@HTTPGet
global static List<Account> sendAccountInfo(){

 RestRequest req = RestContext.Request;
 RestResponse res = RestContext.Response;
 
// Date createdDateValue = Date.valueOf(req.requestURI.substring(req.requestURI.lastIndexOf('=')+1));
 
 
 List<Account> accList = [select id,Name,Phone,PAN_Number__c,createdDate from Account where createdDate = Today];
 
 return accList;

}
}