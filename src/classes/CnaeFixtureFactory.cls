@isTest
public  class CnaeFixtureFactory {

    public static Cnae__C newCnae(){
        return new  Cnae__C ( Cnae__C = '23123'
                            ,Description__c = '23123');
    }

    public static Cnae__C createCnae(){
        return createCnae (newCnae());
                            
    }

    public static Cnae__C createCnae(Cnae__C cnae){
        insert cnae;
        return cnae;
                            
    }


}