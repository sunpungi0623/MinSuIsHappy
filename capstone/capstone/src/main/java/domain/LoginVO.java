package domain;

public class LoginVO {
 
    public String id;
    private String Type;
    private String password;
    private String userName;
    private String userPhone;
    private int isRented;
  
    public LoginVO(){};
    
    
    public String getID() {
        return id;
    }
    public void setID(String id) {
        this.id = id;
    }
    public String getTYPE() {
        return Type;
    }
    public void setTYPE(String Type) {
        this.Type = Type;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getUserPhone() {
        return userPhone;
    }
    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getIsRented() {
 	   return isRented;
    }
    
    public void setIsRented(int isRented) {
 	   this.isRented = isRented;
    }
    

}