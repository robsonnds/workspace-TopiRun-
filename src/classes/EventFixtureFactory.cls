@isTest
public  class EventFixtureFactory {

    //static SObject newNomeObjeto --> cria a instancia do mesmo 
    //static SObject createNomeObject ---> com os parametros do New chama o insere
    //static SObject createNomeObject ---> City insere no banco


    public static Event newEvent(String description, String subject , Datetime startDateTime , Datetime endDateTime){

        Event event = new Event();
        
        event.Description = description;
        

        event.Subject = subject;
        event.StartDateTime = startDateTime;
        event.EndDateTime = endDateTime.addHours (1);

        //event.contactType__c = contactType__c;

        return  event;

    }

    public static Event createEvent( String description, String subject , Datetime  startDateTime , Datetime endDateTime ){

        return createEvent (newEvent(description, subject, startDateTime, endDateTime ));

    }

    public static Event createEvent(Event event){

        insert event;
        return event;

    }

    public static Map<String, SObject> createIntegratedScenario () {
    
        Map<String, SObject> records = new Map<String, SObject>(); 
        
        
        Event event = createEvent('teste descricao', 'teste subject', Datetime.now(), Datetime.now());
        records.put('event', event);

        return records;

    }    
}