import 'dart:convert';

EntriesDataModel entriesDataModelFromJson(String str) => EntriesDataModel.fromJson(json.decode(str));

String entriesDataModelToJson(EntriesDataModel data) => json.encode(data.toJson());

class EntriesDataModel {
    int? statusCode;
    List<EntryModel>? data;
    String? message;
    bool? success;

    EntriesDataModel({
        this.statusCode,
        this.data,
        this.message,
        this.success,
    });

    factory EntriesDataModel.fromJson(Map<String, dynamic> json) => EntriesDataModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? [] : List<EntryModel>.from(json["data"]!.map((x) => EntryModel.fromJson(x))),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "success": success,
    };
}

class EntryModel {
    String? id;
    String? invoiceNumber;
    String? customerId;
    String? customerName;
    List<Item>? items;
    String? totalBill;
    String? gst;
    String? note;
    DateTime? deliverBy;
    String? paymentMethod;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    EntryModel({
        this.id,
        this.invoiceNumber,
        this.customerId,
        this.customerName,
        this.items,
        this.totalBill,
        this.gst,
        this.note,
        this.deliverBy,
        this.paymentMethod,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory EntryModel.fromJson(Map<String, dynamic> json) => EntryModel(
        id: json["_id"],
        invoiceNumber: json["invoiceNumber"],
        customerId: json["customerId"],
        customerName: json["customerName"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        totalBill: json["totalBill"],
        gst: json["gst"],
        note: json["note"],
        deliverBy: json["deliverBy"] == null ? null : DateTime.parse(json["deliverBy"]),
        paymentMethod: json["paymentMethod"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "invoiceNumber": invoiceNumber,
        "customerId": customerId,
        "customerName": customerName,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalBill": totalBill,
        "gst": gst,
        "note": note,
        "deliverBy": deliverBy?.toIso8601String(),
        "paymentMethod": paymentMethod,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Item {
    String? itemId;
    String? itemName;
    int? charges;
    String? id;

    Item({
        this.itemId,
        this.itemName,
        this.charges,
        this.id,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["itemId"],
        itemName: json["itemName"],
        charges: json["charges"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "itemName": itemName,
        "charges": charges,
        "_id": id,
    };
}
