class AuthVerifyRes {

  AuthVerifyRes({
    String? statusmessage = "",
    int? statuscode = 0,
  }) {
    this.statusmessage = statusmessage;
    this.statuscode = statuscode;
  }


    int? statuscode;
    String? statusmessage;

    static AuthVerifyRes error() {
    return AuthVerifyRes();
  }

    factory AuthVerifyRes.fromJson(Map<String, dynamic> json) => AuthVerifyRes(
        statuscode: json["statuscode"],
        statusmessage: json["statusmessage"],
    );

    Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "statusmessage": statusmessage,
    };
}
