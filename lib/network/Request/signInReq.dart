class AuthVerifyReq {
    String email;

    AuthVerifyReq({
        required this.email,
    });

    factory AuthVerifyReq.fromJson(Map<String, dynamic> json) => AuthVerifyReq(
        email: json["email"],
    );

    Map<String, String> toJson() => {
        "email": email,
    };
}
