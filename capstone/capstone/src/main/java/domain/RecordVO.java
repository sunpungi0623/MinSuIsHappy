package domain;

public class RecordVO {
   private String code;
   private String rentDate;
   private String returnDate;
   private String name;
   private String userID;
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

   
   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }
   
   public String getUserID() {
      return userID;
   }

   public void setUserID(String userID) {
      this.userID = userID;
   }
   
   public String getUserPhone() {
      return userPhone;
   }

   public void setUserPhone(String userPhone) {
      this.userPhone = userPhone;
   }
   
}