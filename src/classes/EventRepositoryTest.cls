@isTest
public class EventRepositoryTest {


    @isTest
    public static void criarEvento(){


        Event event = EventFixtureFactory.newEvent('teste descricao', 'teste subject', Datetime.now(), Datetime.now());

        System.debug(event);
        
        EventRepository repository = new EventRepository();

        List<Event> events = new List<Event>{event};
        
        
        List<Event> savedEvents = repository.createEvents(events);
        
          System.assert(savedEvents.size() == 1);
          System.assert(savedEvents.get(0).Id != null);



    }

}