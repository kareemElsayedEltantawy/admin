class GetAddCompanyInfoModel {
  bool? state;
  Data? data;
  List<Message>? message;

  GetAddCompanyInfoModel({this.state, this.data, this.message});

  GetAddCompanyInfoModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    if (json['Message'] != null) {
      message = <Message>[];
      json['Message'].forEach((v) {
        message!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['State'] = state;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    if (message != null) {
      data['Message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? logo;

  Data({this.id, this.name, this.logo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    logo = json['Logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Logo'] = logo;
    return data;
  }
}

class Message {
  String? value;
  int? code;

  Message({this.value, this.code});

  Message.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Code'] = code;
    return data;
  }
}
