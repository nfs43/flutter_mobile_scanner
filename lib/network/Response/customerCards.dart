class CustomerAllCards {
  List<Data>? data = const [];

  CustomerAllCards({List<Data>? data = const []}) {
    if (data != null) {
      this.data = data;
    }
  }

  static CustomerAllCards error() {
    return CustomerAllCards();
  }

  factory CustomerAllCards.fromJson(Map<String, dynamic> json) =>
      CustomerAllCards(
        data: (json["data"] as List<dynamic>?)
            ?.map((x) => Data.fromJson(x))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
      };
}

class Data {
  int id;
  int customerid;
  int profileid;
  Cardinfo cardinfo;
  bool isdefault=false;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Data({
    required this.id,
    required this.customerid,
    required this.profileid,
    required this.cardinfo,
    required this.isdefault,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        customerid: json["customerid"],
        profileid: json["profileid"],
        cardinfo: Cardinfo.fromJson(json["cardinfo"]),
        isdefault: json["isdefault"] ?? false,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerid": customerid,
        "profileid": profileid,
        "cardinfo": cardinfo.toJson(),
        "isdefault": isdefault,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Cardinfo {
  String? zip;
  String? city;
  String? state;
  String? country;
  String cardtype;
  String? lastName;
  String? firstName;
  String? appartment;
  String cardexpiry;
  String cardnumber;
  String? streetAddress;
  bool? isDebitCard;

  Cardinfo({
    this.zip,
    this.city,
    this.state,
    this.country,
    required this.cardtype,
    this.lastName,
    this.firstName,
    this.appartment,
    required this.cardexpiry,
    required this.cardnumber,
    this.streetAddress,
    this.isDebitCard,
  });

  factory Cardinfo.fromJson(Map<String, dynamic> json) => Cardinfo(
        zip: json["zip"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        cardtype: json["cardtype"],
        lastName: json["lastName"],
        firstName: json["firstName"],
        appartment: json["appartment"],
        cardexpiry: json["cardexpiry"],
        cardnumber: json["cardnumber"],
        streetAddress: json["streetAddress"],
        isDebitCard: json["isDebitCard"],
      );

  Map<String, dynamic> toJson() => {
        "zip": zip,
        "city": city,
        "state": state,
        "country": country,
        "cardtype": cardtype,
        "lastName": lastName,
        "firstName": firstName,
        "appartment": appartment,
        "cardexpiry": cardexpiry,
        "cardnumber": cardnumber,
        "streetAddress": streetAddress,
        "isDebitCard": isDebitCard,
      };
}
