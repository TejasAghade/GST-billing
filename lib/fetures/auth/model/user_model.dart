import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    int? statusCode;
    Data? data;
    String? message;
    bool? success;

    UserModel({
        this.statusCode,
        this.data,
        this.message,
        this.success,
    });

    UserModel copyWith({
        int? statusCode,
        Data? data,
        String? message,
        bool? success,
        String? accessToken,
        String? refreshToken,
    }) => 
        UserModel(
            statusCode: statusCode ?? this.statusCode,
            data: data ?? this.data,
            message: message ?? this.message,
            success: success ?? this.success,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data?.toJson(),
        "message": message,
        "success": success,
    };

    @override
    String toString()=> 'UserModel(message: $message, success: $success, data : ${data.toString()})';
}

class Data {
    User? user;
    String? accessToken;
    String? refreshToken;

    Data({
        this.user,
        this.accessToken,
        this.refreshToken,
    });

    Data copyWith({
        User? user,
        String? accessToken,
        String? refreshToken,
    }) => 
        Data(
            user: user ?? this.user,
            accessToken: accessToken ?? this.accessToken,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };

    @override
    String toString() => 'Data(user: ${user.toString()}, accessToken: $accessToken, refreshToken: $refreshToken )';
}

class User {
    String? id;
    String? mobileNumber;
    String? fullName;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    User({
        this.id,
        this.mobileNumber,
        this.fullName,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    User copyWith({
        String? id,
        String? mobileNumber,
        String? fullName,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        User(
            id: id ?? this.id,
            mobileNumber: mobileNumber ?? this.mobileNumber,
            fullName: fullName ?? this.fullName,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        mobileNumber: json["mobileNumber"],
        fullName: json["fullName"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "mobileNumber": mobileNumber,
        "fullName": fullName,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };

    @override
    String toString() => 'User(id: ${id.toString()}, mobileNumber: $mobileNumber, fullName: $fullName)';
}
