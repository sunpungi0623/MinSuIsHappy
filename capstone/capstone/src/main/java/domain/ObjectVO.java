package domain;

public class ObjectVO {
   private String code;
   private String rentDate;
   private String returnDate;
   private String status;
   private String name;
   private String userName;
   private String userPhone;

   public String getCode() {
      return code;
   }

   public void setCode(String code) {
      this.code = code;
   }
   
   public String getRentDate() {
      return rentDate;
   }

   public void setRentDate(String rentDate) {
      this.rentDate = rentDate;
   }
   
   public String getReturnDate() {
      return returnDate;
   }

   public void setReturnDate(String returnDate) {
      this.returnDate = returnDate;
   }
   
   public String getStatus() {
      return status;
   }

   public void setStatus(String status) {
      this.status = status;
   }
   
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
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
   
}