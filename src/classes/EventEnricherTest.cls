@isTest
public with sharing class EventEnricherTest {

        @isTest
        public static void givenEventWhemCreatedAccoutPremium(){


            Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

            List<Account> accounts = new List<Account>{

            (Account) records.get('accoaccoutPremiumEventunt')

        };


        // Event  event = EventFixtureFactory.createEvent('teste', 'teste', '2017-01-07T15:20:45', '2017-01-07T15:20:45'); 


         AccountFilter filter = new AccountFilter();

         List<Account> filteredPremimAccounts = filter.filterByCategoryPremiumAndAnnualRevenue(accounts);

        
         System.assertEquals(accounts.size(), filteredPremimAccounts.size());


        // Account accounts =  AccountFixtureFactory.createAccount('Premium', 100000000 );
         
         //EventRepository repository = new EventRepository();
         
        // List<Account> accounts = repository.createEvents(events);

            
         System.assert(accounts.size()==1);   


        }

    



        //createEventPremmium

        //createEventForPremiumAccoun




}