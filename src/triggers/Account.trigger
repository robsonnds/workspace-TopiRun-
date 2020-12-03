trigger Account on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
System.debug('Trigger de Conta acionada');

List<Account> newAccounts = (List<Account>) Trigger.new; 

List<Account> oldAccounts = (List<Account>) Trigger.oldMap;

System.debug('New Accounts');

System.debug(JSON.serialize ( newAccounts ) );

if (oldAccounts != null && !oldAccounts.isEmpty()) {

    System.debug('old Accounts');

    System.debug(JSON.serialize ( oldAccounts ) );
    
}






}



