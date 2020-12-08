public virtual with sharing class ProjectRepository {

    virtual
    public Project__c create (Project__c project){

        insert project;
        return project;

    }

    virtual
    public List<Project__c> create (List<Project__c> projects){

        insert projects;
        return projects;

    }
    public Project__c findByid(String id ){

        List<Project__c> projects = FindByIds (new List<String> {id} ); 

        return !projects.isEmpty() ? projects.get(0) : null ;

    }

    public List<Project__c> findByIds (List<String> ids ){
        return [ SELECT StartDate__c, endDate__c, ProjectName__c, ExternalId__c, Name, Id FROM Project__c
      
        WHERE Id in :ids ];
    }

   
}