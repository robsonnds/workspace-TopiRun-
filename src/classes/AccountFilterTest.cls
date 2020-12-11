@isTest
public  class AccountFilterTest {

//BDD given when Then

    @isTest
    static void filterAccountsByDocumentNumberTest () {

        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{

            (Account) records.get('account')

        };

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts =  filter.filterByChangeDocumentNumber(accounts, null);

        System.assertEquals(accounts.size(), filteredAccounts.size());


        filteredAccounts =  filter.filterByChangeDocumentNumber(accounts, new Map<Id,Account>());
        
        System.assertEquals(accounts.size(), filteredAccounts.size());

        Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);

        Account changedAccount = accounts.get(0).clone(true, true, true, true);
        changedAccount.DocumentNumber__c = 'X';

        oldAccounts.put(changedAccount.Id, changedAccount);

        filteredAccounts =  filter.filterByChangeDocumentNumber(accounts, oldAccounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size());
        System.assert( filteredAccounts.size() == 1 );
        
        accounts = new List<Account>();
        accounts.add(new Account(Name = 'Teste 01' ));
        accounts.add(new Account(Name = 'Teste 01' ));
        
        filteredAccounts =  filter.filterByChangeDocumentNumber(accounts, null);
        System.assert(filteredAccounts.isEmpty());


    }

}