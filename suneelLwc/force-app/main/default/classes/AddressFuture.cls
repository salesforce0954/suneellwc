public with sharing class AddressFuture
{
 public AddressFuture()
 {
  List<String> addresses = new List<String>();

AddressHelper ah1 = new AddressHelper('1 hase st', 'san Fransisco', 'CA', '94105');

AddressHelper ah2 = new AddressHelper('2 hase st', 'san Fransisco', 'CA', '94105');

AddressHelper ah3 = new AddressHelper('3 hase st', 'san Fransisco', 'CA', '94105');

//serialize my objects ah1, ah2, ah3 
 addresses.add(JSON.serialize(ah1));
 addresses.add(JSON.serialize(ah2));
 addresses.add(JSON.serialize(ah3));
 system.debug('Addresses '+addresses);

callfuture(addresses); //Invoke the future method by passing a string addresses where it is serialized form of Apex class objects.
 } 

 @future
 public static void callfuture(List<string> addresses)
 {
  AddressHelper currAddress = null;
  for(string ser: addresses)
  {
   currAddress = (AddressHelper)JSON.deserialize(ser, AddressHelper.class);
   System.debug('Deserialized in future : '+ currAddress.street);
  } 
 }
}