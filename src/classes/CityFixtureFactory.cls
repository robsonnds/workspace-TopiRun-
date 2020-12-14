@isTest
public class CityFixtureFactory {

    //static SObject newNomeObjeto --> cria a instancia do mesmo 
    //static SObject createNomeObject ---> com os parametros do New chama o insere
    //static SObject createNomeObject ---> City insere no banco

    public static City__c newCity () {
        return newCity ('3550308', 'São Paulo');
    }

    public static City__c newCity (String ibge, String city) {
        return newCity__c ( ibgeCode__c = ibge
                        , CityName__c = city );

    }

    public static City__c createCity (String ibge, String city) {
        return createCity (newCity(ibge, city));
    }

    public static City__c createCity () {
        return createCity (newCity());
    }

    public static City__c createCity (City__c city) {
        insert city;
        return city;
    }

}
