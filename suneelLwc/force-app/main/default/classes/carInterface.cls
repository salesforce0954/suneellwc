public class carInterface implements InterfaceExample{
    
    public decimal mileage;
    public decimal price;
    public boolean isAirBags;
   
    public List<String> carModels;
    public List<Account> accList;
    public set<String> carModelSet;
  
        
    public void bmw(){
        
        carModels = new List<String>();
        carModels.add('2010');
        carModels.add('2010');
        carModels.add('2012');
        system.debug('Size of List '+carModels.size());
        
        system.debug('List Result' + carModels);
                     
        carModelSet = new Set<String>();
        carModelSet.add('2010');
        carModelSet.add('2010');
        carModelSet.add('2012');
            system.debug('Size of Set '+carModelSet.size());
        system.debug('Set Result' + carModelSet);
         
          
       mileage = 24.90;
       price =  200000.00;
       isAirBags = true;
        if((isAirBags == true && price > 200000.00) || mileage > 24.00){
            system.debug( 'BMW Details '+mileage);
        }else{            
            system.debug( 'BMW Details '+isAirBags);
        }
    }
    
    public void benz(){
        mileage = 25.90;
       price =  220000.00;
       isAirBags = false;
    }
    
    public void audi(){
        mileage = 27.90;
       price =  270000.00;
       isAirBags = true;
    }
}