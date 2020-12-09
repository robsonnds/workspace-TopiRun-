public virtual  class Event {

    EventRepository repository ;


 public  Event () {

    repository = new EventRepository();

 }

public Event StartEvent(){

    Event startEvent = new Event();



   return startEvent;
}


}