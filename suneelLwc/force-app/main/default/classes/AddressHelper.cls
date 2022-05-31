public with sharing class AddressHelper
{
 public string street{set; get;}
 public string city{set; get;}
 public string state{set; get;}
 public string zip{set; get;}

 public AddressHelper(String s, String c, String st, String z)
 {
  Street = s;
  City = c;
  State = st;
  zip =z;
 }
}