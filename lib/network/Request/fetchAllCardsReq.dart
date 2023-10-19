// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class FetchAllCardsReq {
    String id;

    FetchAllCardsReq({
        required this.id,
    });

    factory FetchAllCardsReq.fromJson(Map<String, dynamic> json) => FetchAllCardsReq(
        id: json["id"],
    );

    Map<String, String> toJson() => {
        "id": id,
    };
}
