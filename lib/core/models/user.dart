class UserData {
  User user;
  String token;

  UserData({this.user, this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String email;
  String id;
  String username;
  String phonenumber;
  String kycStatus;
  bool active;
  String referralCode;
  PhoneNumberDetails phoneNumberDetails;
  UserRole userRole;
  UserProfile userProfile;

  User(
      {this.email,
      this.id,
      this.username,
      this.phonenumber,
      this.kycStatus,
      this.active,
      this.referralCode,
      this.phoneNumberDetails,
      this.userRole,
      this.userProfile});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    username = json['username'];
    phonenumber = json['phonenumber'];
    kycStatus = json['kycStatus'];
    active = json['active'];
    referralCode = json['referralCode'];
    phoneNumberDetails = json['phoneNumberDetails'] != null
        ? new PhoneNumberDetails.fromJson(json['phoneNumberDetails'])
        : null;
    userRole = json['userRole'] != null
        ? new UserRole.fromJson(json['userRole'])
        : null;
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['username'] = this.username;
    data['phonenumber'] = this.phonenumber;
    data['kycStatus'] = this.kycStatus;
    data['active'] = this.active;
    data['referralCode'] = this.referralCode;
    if (this.phoneNumberDetails != null) {
      data['phoneNumberDetails'] = this.phoneNumberDetails.toJson();
    }
    if (this.userRole != null) {
      data['userRole'] = this.userRole.toJson();
    }
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class PhoneNumberDetails {
  String phoneNumber;
  String callingCode;
  String flag;

  PhoneNumberDetails({this.phoneNumber, this.callingCode, this.flag});

  PhoneNumberDetails.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    callingCode = json['callingCode'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['callingCode'] = this.callingCode;
    data['flag'] = this.flag;
    return data;
  }
}

class UserRole {
  String id;
  String role;
  String description;

  UserRole({this.id, this.role, this.description});

  UserRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['description'] = this.description;
    return data;
  }
}

class UserProfile {
  String id;
  String displayName;
  String currency;
  String profilePicture;
  String identificationType;
  String documentVerificationNumber;
  String dateOfBirth;
  String country;
  bool twoFactorEnabled;
  bool orderNotification;
  bool chatNotification;
  bool marketNotification;
  bool pushNotification;
  bool otcNotification;
  bool withdrawalsNotification;
  bool utilitiesNotification;

  UserProfile(
      {this.id,
      this.displayName,
      this.currency,
      this.profilePicture,
      this.identificationType,
      this.documentVerificationNumber,
      this.dateOfBirth,
      this.country,
      this.twoFactorEnabled,
      this.orderNotification,
      this.chatNotification,
      this.marketNotification,
      this.pushNotification,
      this.otcNotification,
      this.withdrawalsNotification,
      this.utilitiesNotification});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    currency = json['currency'];
    profilePicture = json['profilePicture'];
    identificationType = json['identificationType'];
    documentVerificationNumber = json['documentVerificationNumber'];
    dateOfBirth = json['dateOfBirth'];
    country = json['country'];
    twoFactorEnabled = json['twoFactorEnabled'];
    orderNotification = json['orderNotification'];
    chatNotification = json['chatNotification'];
    marketNotification = json['marketNotification'];
    pushNotification = json['pushNotification'];
    otcNotification = json['otcNotification'];
    withdrawalsNotification = json['withdrawalsNotification'];
    utilitiesNotification = json['utilitiesNotification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayName'] = this.displayName;
    data['currency'] = this.currency;
    data['profilePicture'] = this.profilePicture;
    data['identificationType'] = this.identificationType;
    data['documentVerificationNumber'] = this.documentVerificationNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['country'] = this.country;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['orderNotification'] = this.orderNotification;
    data['chatNotification'] = this.chatNotification;
    data['marketNotification'] = this.marketNotification;
    data['pushNotification'] = this.pushNotification;
    data['otcNotification'] = this.otcNotification;
    data['withdrawalsNotification'] = this.withdrawalsNotification;
    data['utilitiesNotification'] = this.utilitiesNotification;
    return data;
  }
}
