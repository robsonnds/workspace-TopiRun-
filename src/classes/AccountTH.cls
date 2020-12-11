/**
 * 
 * Nao pode ser Grande
 * 
 * Ela delega 
 * 
 * Filtra (Filter)
 * Valida  (Validator)
 * Enriquece (Enricher)
 * Publicar (Publisher)

 */

public virtual with sharing class AccountTH extends TriggerHandler {

    List<Account> newAccounts ; //= (List<Account>) Trigger.new; 

    Map<Id,Account> oldAccounts ; //= (Map<Id,Account>) Trigger.oldMap;

    AccountFilter filter;

    AccountValidator validator;

    EventEnricher eventEnricher;


    public AccountTH () {
        this ( (List<Account>) Trigger.new, (Map<Id,Account>) Trigger.oldMap );
    }
    


    public AccountTH (List<Account> newAccounts , Map<Id,Account> oldAccounts){
        
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.filter = new AccountFilter();
        this.validator = new AccountValidator();

    }
     
  
    override
    public void beforeInsert() {

        validateDocumentNumber();

    }
    
    override
    public void beforeUpdate() {

        validateDocumentNumber();

    }

    override
    public void afterInsert(){


        filterByCategoryPremiumAndAnnualRevenue();

        System.debug('Trigger de Conta acionada' + Trigger.operationType );
        System.debug(JSON.serialize ( newAccounts ) );


    }

    override
    public void afterUpdate(){

        System.debug('Trigger de Conta acionada' + Trigger.operationType );

        System.debug(JSON.serialize ( newAccounts ) );
        System.debug(JSON.serialize  ( oldAccounts ) );
         

    }

    virtual
    public void validateDocumentNumber(){

        List<Account> filterdAccounts = this.filter.filterByChangeDocumentNumber(newAccounts, oldAccounts);

        this.validator.validateDocumentNumber(filterdAccounts);

    }

    virtual
    public void filterByCategoryPremiumAndAnnualRevenue(){

        List<Account> filterdAccountsPremium = this.filter.filterByCategoryPremiumAndAnnualRevenue(newAccounts);

        this.eventEnricher.createEventForPremiumAccoun(filterdAccountsPremium);

    }


}