class UserModel {
    int code;
    String msg;
    Data data;

    UserModel({this.code, this.msg, this.data});

    UserModel.fromJson(Map<String, dynamic> json) {
        code = json['code'];
        msg = json['msg'];
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['msg'] = this.msg;
        if (this.data != null) {
        data['data'] = this.data.toJson();
        }
        return data;
    }
}

class Data {
    int userId;
    String userName;
    String phone;
    String password;
    String nickName;
    String createTime;

    Data(
        {this.userId,
        this.userName,
        this.phone,
        this.password,
        this.nickName,
        this.createTime});

    Data.fromJson(Map<String, dynamic> json) {
        userId = json['userId'];
        userName = json['userName'];
        phone = json['phone'];
        password = json['password'];
        nickName = json['nickName'];
        createTime = json['createTime'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['userId'] = this.userId;
        data['userName'] = this.userName;
        data['phone'] = this.phone;
        data['password'] = this.password;
        data['nickName'] = this.nickName;
        data['createTime'] = this.createTime;
        return data;
    }
}