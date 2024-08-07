// To parse this JSON data, do
//
//     final quotationDataModel = quotationDataModelFromJson(jsonString);

import 'dart:convert';

QuotationDataModel quotationDataModelFromJson(String str) => QuotationDataModel.fromJson(json.decode(str));

String quotationDataModelToJson(QuotationDataModel data) => json.encode(data.toJson());

class QuotationDataModel {
    int? statusCode;
    List<QuotationModel>? data;
    String? message;
    bool? success;

    QuotationDataModel({
        this.statusCode,
        this.data,
        this.message,
        this.success,
    });

    QuotationDataModel copyWith({
        int? statusCode,
        List<QuotationModel>? data,
        String? message,
        bool? success,
    }) => 
        QuotationDataModel(
            statusCode: statusCode ?? this.statusCode,
            data: data ?? this.data,
            message: message ?? this.message,
            success: success ?? this.success,
        );

    factory QuotationDataModel.fromJson(Map<String, dynamic> json) => QuotationDataModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? [] : List<QuotationModel>.from(json["data"]!.map((x) => QuotationModel.fromJson(x))),
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

class QuotationModel {
    String? id;
    String? item;
    int? charges;

    QuotationModel({
        this.id,
        this.item,
        this.charges,
    });

    QuotationModel copyWith({
        String? id,
        String? item,
        int? charges,
    }) => 
        QuotationModel(
            id: id ?? this.id,
            item: item ?? this.item,
            charges: charges ?? this.charges,
        );

    factory QuotationModel.fromJson(Map<String, dynamic> json) => QuotationModel(
        id: json["_id"],
        item: json["item"],
        charges: json["charges"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "item": item,
        "charges": charges,
    };
}
