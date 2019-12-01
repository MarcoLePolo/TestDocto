public with sharing class C01_DisplayWeatherInfo {
    public static String endpointUrl = 'http://api.geonames.org/findNearByWeatherJSON?lat=43&lng=-2&username=demo';
    public C01_DisplayWeatherInfo() {

    }
    @AuraEnabled(cacheable=true)
    public static map<String,String> getAccount(String recordId){
        system.debug('getAccount id '+recordId);
        // if(id == null){
        //     id userId = UserInfo.getUserId();
        //     User u = [SELECT id, city FROM user WHERE Id = :id];
        // }else{
            String query = '';
           system.debug('getAccount query '+query);
            List<Account> accounts =[SELECT id,Humidity__c,Temperature__c,Wind_Speed__c FROM Account WHERE Id= :recordId];
             system.debug('getAccount accounts '+accounts);
            // }
        map<String,String> weatherInfo = callwebService(accounts.get(0));
        return weatherInfo;
    }

    public static map<String,String> callwebService(Account acc){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
         HttpResponse res = new HttpResponse();
         String endpoint = buildEnpointWeather(endpointUrl,acc);
         req.setEndpoint(endpoint);
         try{
             res = http.send(req);
         }catch(Exception ex){
             system.debug(ex.getMessage());
         }
         map<String,String> m = (Map<String, String>)JSON.deserializeUntyped(res.getBody());
        return m;
    }
    public static String buildEnpointWeather(String endpointUrl,Account acc){
        //lat=43&lng=-2&username=demo
        String endpoint =  endpointUrl;
        // endpoint += 'lat=' +acc.geolocation__latitude__s;
        // endpoint +='&lng='+acc.geolocation__longitude__s;
        endpoint  += '&username=marc.denis' ;
        return endpoint;
    }

     public Static String buildEnpointcity(String endpointUrl,String city){
        //lat=43&lng=-2&username=demo
        String endpoint =  endpointUrl;
        // endpoint += 'lat=' +geolocation__latitude__s;
        // endpoint +='&lng='+geolocation__longitude__s;
        // endpoint  += '&username=marc.denis' ;
        return endpoint;
    }
}
