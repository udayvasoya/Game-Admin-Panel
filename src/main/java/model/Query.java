package model;

public class Query
{
    private static int id;

    public Query(int id) {
        this.id = id;
    }

    public static int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
