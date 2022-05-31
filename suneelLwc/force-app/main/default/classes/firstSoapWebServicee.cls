global class firstSoapWebServicee{

    webservice static string createLead(string firstName,string lastName,string companyName,string leadEmail,string leadPhone){
      try{
          Lead ld = new Lead();
          ld.FirstName = firstName;
          ld.LastName = lastName;
          ld.Company = companyName;
          ld.Email = leadEmail;
          ld.Phone = leadPhone;
          insert ld;
          return ld.id;
         }catch(Exception e){
           return 'Exception occurs again';
         }
    
   }
}