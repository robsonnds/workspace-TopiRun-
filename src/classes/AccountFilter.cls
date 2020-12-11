public with sharing class AccountFilter {

    public List<Account> filterByChangeDocumentNumber( List<Account> newAccounts
                                                       , Map<Id,Account> oldAccounts ){
        List<Account> filteredAccounts = new List<Account>();
        
        for (Account account  : newAccounts) {
            if ( String.isEmpty(account.DocumentNumber__c) ) {
                continue;
            } 

            if ( oldAccounts == null 
                || oldAccounts.isEmpty() ) {

                filteredAccounts.add(account);
                continue;
            
            }

            if ( account.DocumentNumber__c == oldAccounts.get(account.Id).DocumentNumber__c ) {
                continue;
            }
            
            filteredAccounts.add( account );

        }

        return filteredAccounts;
    }

    public List<Account> filterByCategoryPremiumAndAnnualRevenue(List<Account> newAccounts) {

        List<Account> filteredAccountsPremium = new List<Account>();

        for (Account account : newAccounts) {

            if( String.isEmpty(account.Category__c)) {
                continue;
            }

            if( account.Category__c == 'Premium' && account.AnnualRevenue > 1000000) {
                filteredAccountsPremium.add(account);
            }
        }

        return filteredAccountsPremium;
    }

}