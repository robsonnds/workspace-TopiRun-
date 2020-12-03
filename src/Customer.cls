//NomeDaClase
//<public
//<public|private|global>[modificadores] class <NomeDaClasse>{

//}

public  virtual class Customer {

    Decimal amount;
    Double descount;
    
    
    String nome;
    String status;
    CustomerType type;

    List<String> contacts = new List<String>();
    List<String> contacts;

// boa pratica da topi
    List<Contact> contacts = new List<Contact>();

    Set<Contact> createdConts;

    //index
    Map<String, Contact> regionContacts = new Map<String, Contact>{
        'SP' => new Contact (FirstName = 'Bisso')
        , 'SP' => new Contact (FirstName = 'Bissolino')
    };
    //agrupando
    Map<String, List<Contact>> contactsByRegion = new Map<String,List<Contact>>{
        'SP' => new Contact ( FirstName = 'Bisso' )
        , 'SP' => new Contact ( FirstName = 'Bissolino' )

    };

    


    
   
    //[modificadores] <Tipo de Retorno> nomeDoMetodo{[Parametros]} {}
    //
    //[public | protect |private |default]
    virtual
    public void save() {

        String value ='';

    }
    public List<contact> filteredContactByRegion(){
     
        List<contact> filteredContacts = new List<contact>();
      
        for (Contact contact : contacts) {

            if (contact.Name == 'xxxx') {

                filteredContacts.add(contact);
                
            }
            
        }            

        return filteredContacts;
    }


}
