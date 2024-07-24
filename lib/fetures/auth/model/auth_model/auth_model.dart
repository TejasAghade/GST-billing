// import 'dart:convert';

// UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// class UserModel {
//     int? statusCode;
//     Data? data;
//     String? message;
//     bool? success;
//     String? accessToken;
//     String? refreshToken;

//     UserModel({
//         this.statusCode,
//         this.data,
//         this.message,
//         this.success,
//         this.accessToken,
//         this.refreshToken
//     });

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         statusCode: json["statusCode"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         message: json["message"],
//         success: json["success"],
//         accessToken: json["accessToken"]??"",
//         refreshToken: json["accessToken"]??"",
//     );

// }

// class Data {
//     User? user;
//     String? accessToken;
//     String? refreshToken;

//     Data({
//         this.user,
//         this.accessToken,
//         this.refreshToken,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//         accessToken: json["accessToken"],
//         refreshToken: json["refreshToken"],
//     );

// }

// class User {
//     String? id;
//     String? mobileNumber;
//     String? fullName;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     User({
//         this.id,
//         this.mobileNumber,
//         this.fullName,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         mobileNumber: json["mobileNumber"],
//         fullName: json["fullName"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

// }
