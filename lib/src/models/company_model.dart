class CompanyModel {
  bool? state;
  List<CompanyData>? data;
  List<Message>? message;

  CompanyModel({this.state, this.data, this.message});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    state = json['State'];
    if (json['Data'] != null) {
      data = <CompanyData>[];
      json['Data'].forEach((v) {
        data!.add(CompanyData.fromJson(v));
      });
    }
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
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (message != null) {
      data['Message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyData {
  String? id;
  String? name;
  String? logo;
  List<ApplicationUsers>? applicationUsers;
  List<Department>? departments;

  CompanyData(
      {this.id, this.name, this.logo, this.applicationUsers, this.departments});

  CompanyData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    logo = json['Logo'];
    if (json['applicationUsers'] != null) {
      applicationUsers = <ApplicationUsers>[];
      json['applicationUsers'].forEach((v) {
        applicationUsers!.add(ApplicationUsers.fromJson(v));
      });
    }
    if (json['Departments'] != null) {
      departments = <Department>[];
      json['Departments'].forEach((v) {
        departments!.add(Department.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Logo'] = logo;
    if (applicationUsers != null) {
      data['applicationUsers'] =
          applicationUsers!.map((v) => v.toJson()).toList();
    }
    if (departments != null) {
      data['Departments'] = departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApplicationUsers {
  String? userName;
  bool? emailConfirmed;
  String? passwordHash;
  String? companyId;
  String? departmentId;
  Department? department;
  int? accountType;
  String? crmUserId;
  String? id;
  String? email;
  String? phoneNumber;
  String? image;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  bool? isDeactivated;
  String? name;
  String? deletedOn;
  String? deletedBy;
  String? ownerId;
  String? owner;

  ApplicationUsers(
      {this.userName,
      this.emailConfirmed,
      this.passwordHash,
      this.companyId,
      this.departmentId,
      this.department,
      this.accountType,
      this.crmUserId,
      this.id,
      this.email,
      this.phoneNumber,
      this.image,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.isDeleted,
      this.isDeactivated,
      this.name,
      this.deletedOn,
      this.deletedBy,
      this.ownerId,
      this.owner});

  ApplicationUsers.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    emailConfirmed = json['EmailConfirmed'];
    passwordHash = json['PasswordHash'];
    companyId = json['Company_id'];
    departmentId = json['departmentId'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    accountType = json['AccountType'];
    crmUserId = json['CrmUserId'];
    id = json['Id'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    image = json['Image'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    modifiedBy = json['ModifiedBy'];
    modifiedOn = json['ModifiedOn'];
    isDeleted = json['IsDeleted'];
    isDeactivated = json['IsDeactivated'];
    name = json['Name'];
    deletedOn = json['DeletedOn'];
    deletedBy = json['DeletedBy'];
    ownerId = json['OwnerId'];
    owner = json['Owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['EmailConfirmed'] = emailConfirmed;
    data['PasswordHash'] = passwordHash;
    data['Company_id'] = companyId;
    data['departmentId'] = departmentId;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    data['AccountType'] = accountType;
    data['CrmUserId'] = crmUserId;
    data['Id'] = id;
    data['Email'] = email;
    data['PhoneNumber'] = phoneNumber;
    data['Image'] = image;
    data['CreatedBy'] = createdBy;
    data['CreatedOn'] = createdOn;
    data['ModifiedBy'] = modifiedBy;
    data['ModifiedOn'] = modifiedOn;
    data['IsDeleted'] = isDeleted;
    data['IsDeactivated'] = isDeactivated;
    data['Name'] = name;
    data['DeletedOn'] = deletedOn;
    data['DeletedBy'] = deletedBy;
    data['OwnerId'] = ownerId;
    data['Owner'] = owner;
    return data;
  }
}

class Department {
  String? id;
  String? name;
  String? logo;
  String? companyId;
  String? isDeleted;
  String? createdOn;
  String? lastUpdatedOn;

  Department({
    this.id,
    this.name,
    this.logo,
    this.companyId,
    this.isDeleted,
    this.createdOn,
    this.lastUpdatedOn,
  });

  Department.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    logo = json['Logo'];
    companyId = json['CompanyId'];
    isDeleted = json['IsDeleted'];
    createdOn = json['CreatedOn'];
    lastUpdatedOn = json['LastUpdatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Logo'] = logo;
    data['CompanyId'] = companyId;
    data['IsDeleted'] = isDeleted;
    data['CreatedOn'] = createdOn;
    data['LastUpdatedOn'] = lastUpdatedOn;

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
