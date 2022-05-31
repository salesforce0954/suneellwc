@RestResource(urlMapping='/plappsApplicant/*')
global class plApplicantFromOrgOne{

@HttpPost
global static string createNewApplicant(string applicationDetails,string firstName,string lastName){
        system.debug('Applicant details of Org2');
        List<Applicant_Org2__c> applicantList = [select Application_Org2__c,First_Name__c,Last_Name__c from Applicant_Org2__c  where Application_Org2__c =:applicationDetails];
        system.debug('Applicant List 1 '+applicantList.size());
           Applicant_Org2__c applicant1 = new Applicant_Org2__c();
           applicant1.First_Name__c = firstName;
           system.debug('First Name '+applicant1.First_Name__c);
           applicant1.Last_Name__c = lastName;
           system.debug('Last Name '+applicant1.Last_Name__c);
           
           applicant1.Application_Org2__c= string.valueOf(applicationDetails);
           system.debug('application Id '+applicationDetails);
          
          applicantList.add(applicant1);
                  system.debug('Applicant List 2'+applicantList.size());

          
          if(applicantList.size() > 0){
             upsert applicantList;
          }
        
        return applicantList[0].Id;
    }
  
  }