class LoginRequestes {
  String email;
  String password;
  LoginRequestes(this.email, this.password);
}

class RegisterRequestes {
  String userName;
  String password;
  String mobileCountryCode;
  String mobileNumber;
  String email;
  String profilePicture;
  RegisterRequestes(this.userName, this.password, this.mobileCountryCode,
      this.mobileNumber, this.email, this.profilePicture);
}
