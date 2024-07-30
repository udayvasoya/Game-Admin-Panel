package model;

public class Coordinate
{
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String game;
    private byte[] image;

    public Coordinate(int id, String fullname, String email, String phone, String game, byte[] image) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.game = game;
        this.image = image;
    }

    public Coordinate(String fullname, String email, String phone, String game, byte[] image) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.game = game;
        this.image = image;
    }

    public Coordinate(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGame() {
        return game;
    }

    public void setGame(String game) {
        this.game = game;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }
}
