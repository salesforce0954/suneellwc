public class retrieveCovidCount {
    
   public integer recoveredinArea = 0;
   public static integer recoveredinCountry = 0;
    
    public retrieveCovidCount(integer recoveredinArea){
        this.recoveredinArea = recoveredinArea;
        recoveredinCountry = recoveredinArea; 
    } 
    
    public void treatPatient(){
      //recoveredinArea++;   
      recoveredinCountry++;
    }
    public static void printTreated(){
        system.debug('Recovered in country'+recoveredinCountry);
    }

}