@RestResource(urlMapping='/plapps/*')
global class plAppsFromOrgOne{
    
   @HttpPost
    global static string createNewApplication(string applicantType,boolean isApplicantEligible){
    
      string resId;
      string status;
      
            RestRequest req = RestContext.request;
            system.debug('complete req'+req );
            
       try{
       
        
       Application_Org2__c app = new Application_Org2__c();
       app.Applicant_Type__c = applicantType;
       app.is_Applicant_Eligible__c = isApplicantEligible;
       insert app;
       resId = app.id;

       system.debug('Response Id of Org 2 from Org 1 '+resId);
       
       
       }catch(Exception e){
         resId=  'Error occured during new lead creation=>'+e.getMessage();   
       }
       return resId;     
    }
    
   
}