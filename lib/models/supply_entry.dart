import 'dart:convert';

List<SupplyEntry> supplyEntryFromJson(String str) => List<SupplyEntry>.from(json.decode(str).map((x) => SupplyEntry.fromJson(x)));

String supplyEntryToJson(List<SupplyEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupplyEntry {
    String model;
    String pk;
    Fields fields;

    SupplyEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory SupplyEntry.fromJson(Map<String, dynamic> json) => SupplyEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    int price;
    String description;
    String image;

    Fields({
        required this.name,
        required this.price,
        required this.description,
        required this.image,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "image": image,
    };
}
