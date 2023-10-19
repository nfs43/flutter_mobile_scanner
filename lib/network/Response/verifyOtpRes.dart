class VerifyOtpRes {
  int? statuscode;
  String?  statusmessage;
  Data data = Data(ctoken: '');
  List<dynamic>? validation;

  VerifyOtpRes(
      {int? statuscode = 0,
      String? statusmessage = "",
      Data? data,
      List<dynamic>? validation = const []}) {
    if (statuscode != 0) {
      this.statuscode = statuscode;
    }
    if (statusmessage != null) {
      this.statusmessage = statusmessage;
    }
    if (data != null) {
      this.data = data;
    }
    if (validation != null) {
      this.validation = validation;
    }
  }

  static VerifyOtpRes error() {
    return VerifyOtpRes();
  }

  factory VerifyOtpRes.fromJson(Map<String, dynamic> json) => VerifyOtpRes(
        statuscode: json["statuscode"],
        statusmessage: json["statusmessage"],
        data: Data.fromJson(json["data"]),
        validation: List<dynamic>.from(json["validation"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "statusmessage": statusmessage,
        "data": data.toJson(),
        "validation": List<dynamic>.from(validation!.map((x) => x)),
      };
}

class Data {
  String ctoken;

  Data({
    required this.ctoken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ctoken: json["ctoken"],
      );

  Map<String, dynamic> toJson() => {
        "ctoken": ctoken,
      };
}
