public virtual class EventEnricher {

    EventRepository repository;

    List<Account> newAccounts;
    List<Event> newEvents;
    

    public EventEnricher () {

        repository = new EventRepository();
        
    }

    public  Event createEventPremmium (Account account){


        Event event = new Event();

        event.Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
        event.Subject = 'Apresentação instucional dos produtos Premium';
        event.StartDateTime = account.CreatedDate;
        event.EndDateTime = account.CreatedDate.addHours(1);
        event.WhatId = account.Id;
        event.ContactType__c ='Telefônico';

        return event;

    }    

        public List<Event> createEventForPremiumAccoun (List<Account> premiumAccounts){


            List<Event> events = new List<Event>();


            for (Account account : premiumAccounts ) {

                events.add( createEventPremmium(account));
    
            }
    
            return repository.createEvents (events);
    

    }

}