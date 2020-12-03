
public virtual class AccountRepository {

    virtual
    public List<Account> findByName (String name) {

        return [ SELECT Id, Name, Type, BillingStreet, BillingCity, BillingState
        , BillingPostalCode, BillingCountry, CreatedDate
         FROM Account
         Where Name like :name ];




    }

    virtual
    public List<Account> findwithContactsByName (String name) {

        return [ SELECT Id, Name, Type, BillingStreet, BillingCity, BillingState
        , BillingPostalCode, BillingCountry, CreatedDate, CreatedBy.Name
        , ( SELECT Id, FirstName, LastName FROM Contacts )
         FROM Account
         Where Name like :name ];




    }
    
}
