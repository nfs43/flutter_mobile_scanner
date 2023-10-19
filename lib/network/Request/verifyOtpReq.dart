class verifyOtpReq{
  String email;
  String code;

  verifyOtpReq({
    required this.email,
    required this.code
  });
  
   factory verifyOtpReq.fromJson(Map<String, dynamic> json) => verifyOtpReq(
        email: json["email"],
        code: json["code"],
    );

    Map<String, String> toJson() => {
        "email": email,
        "code": code,
    };
}