@RestResource(urlMapping='/createContactRecord/*')
   global with sharing class createContactRecordCLass {
     @HttpPost
      global Static string fetchAccount(){
      RestRequest req = RestContext.request;
      RestResponse res = Restcontext.response;
      string jsonString=req.requestBody.tostring();
      system.debug('Request String '+jsonString);
      responseWrapper wResp=(responseWrapper) JSON.deserialize(jsonString,responseWrapper.class);
      system.debug('Response string '+wResp);
      Contact obj=new Contact();
      obj.firstName=wResp.FirstName;
      obj.lastName=wResp.LastName;
      obj.email=wResp.email;
      Insert obj;
       
        return 'Success';
      }
      global class responseWrapper{
       global string FirstName;
       global string LastName;
       global string email;
      }
   }