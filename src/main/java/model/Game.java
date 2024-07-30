package model;

public class Game
{
    private int id;
    private String game_name;
    private String game_desc;
    private String game_rules;
    private int price;
    private byte[] image;
    private String date;

    public Game(int id, String game_name, String game_desc, String game_rules, int price, byte[] image, String date)
    {
        this.id = id;
        this.game_name = game_name;
        this.game_desc = game_desc;
        this.game_rules = game_rules;
        this.price = price;
        this.image = image;
        this.date = date;
    }

    public Game(int id) {
        this.id = id;
    }

    public Game(String game_name, String game_desc, String game_rules, int price, byte[] image, String date) {
        this.game_name = game_name;
        this.game_desc = game_desc;
        this.game_rules = game_rules;
        this.price = price;
        this.image = image;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGame_name() {
        return game_name;
    }

    public void setGame_name(String game_name) {
        this.game_name = game_name;
    }

    public String getGame_desc() {
        return game_desc;
    }

    public void setGame_desc(String game_desc) {
        this.game_desc = game_desc;
    }

    public String getGame_rules() {
        return game_rules;
    }

    public void setGame_rules(String game_rules) {
        this.game_rules = game_rules;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
