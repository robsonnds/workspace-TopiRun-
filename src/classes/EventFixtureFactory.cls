@isTest
public  class EventFixtureFactory {

    //static SObject newNomeObjeto --> cria a instancia do mesmo 
    //static SObject createNomeObject ---> com os parametros do New chama o insere
    //static SObject createNomeObject ---> City insere no banco


    public static Event newEvent(){

        return  newEvent ( 'teste descricao', 'teste subject', 'Telefônico' );

    }
    

    public static Event createEvent(String Description, String Subject String ContactType__c ){

        return createEvent (newEvent());

    }

    public static Event createEvent(Event event){

        insert event;
        return event;

    }

}