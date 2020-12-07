public virtual with sharing class ProjectRepository {

    virtual
    public Project__C create (Project__C project){

        insert project;
        return project;

    }

    virtual
    public List<Project__C> create (List<Project__C> projects){

        insert projects;
        return projects;

    }

}