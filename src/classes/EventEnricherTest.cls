@isTest
public with sharing class EventEnricherTest {

        @isTest
        public static void givenEventWhemCreatedAccoutPremium(){


            Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

            List<Account> accounts = new List<Account>{

                (Account) records.get('accountPremiumAboveMillion') 

             };

         AccountFilter filter = new AccountFilter();

         List<Account> filteredPremimAccounts = filter.filterByCategoryPremiumAndAnnualRevenue(accounts);

        
         System.assertEquals(accounts.size(), filteredPremimAccounts.size());

         System.assert(accounts.size()==1);   

        }

    
        /* @isTest
        public static void createEventPremmium(){

            Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

            List<Account> accounts = new List<Account>{

                (Account) records.get('account') 

             };


            Account account = new Account();

           
            EventEnricher   eventEnricher = new EventEnricher();

            eventEnricher.createEventPremmium(accounts);
            
            

        } */


}