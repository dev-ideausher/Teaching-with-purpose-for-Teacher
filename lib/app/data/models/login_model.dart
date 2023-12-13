///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginModelUser {
/*
{
  "_id": "657021118c2337e8d3e2e307",
  "joiningDate": "2023-12-06T07:20:35.124Z",
  "experience": "",
  "subject": "",
  "address": "",
  "name": "John Doe",
  "email": "teacher321@gmail.com",
  "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
  "gender": "Male",
  "dob": "",
  "firebaseUid": "wpnCVSW0MwQjAtkArhznsLWSNnq1",
  "firebaseSignInProvider": "custom",
  "active": true,
  "isDeleted": false,
  "__t": "Teachers",
  "createdAt": "2023-12-06T07:21:53.404Z",
  "updatedAt": "2023-12-06T07:21:53.404Z",
  "__v": 0
} 
*/

  String? Id;
  String? joiningDate;
  String? experience;
  String? subject;
  String? address;
  String? name;
  String? email;
  String? image;
  String? gender;
  String? dob;
  String? firebaseUid;
  String? firebaseSignInProvider;
  bool? active;
  bool? isDeleted;
  String? T;
  String? createdAt;
  String? updatedAt;
  int? V;

  LoginModelUser({
    this.Id,
    this.joiningDate,
    this.experience,
    this.subject,
    this.address,
    this.name,
    this.email,
    this.image,
    this.gender,
    this.dob,
    this.firebaseUid,
    this.firebaseSignInProvider,
    this.active,
    this.isDeleted,
    this.T,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  LoginModelUser.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    joiningDate = json['joiningDate']?.toString();
    experience = json['experience']?.toString();
    subject = json['subject']?.toString();
    address = json['address']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    image = json['image']?.toString();
    gender = json['gender']?.toString();
    dob = json['dob']?.toString();
    firebaseUid = json['firebaseUid']?.toString();
    firebaseSignInProvider = json['firebaseSignInProvider']?.toString();
    active = json['active'];
    isDeleted = json['isDeleted'];
    T = json['__t']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['joiningDate'] = joiningDate;
    data['experience'] = experience;
    data['subject'] = subject;
    data['address'] = address;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['gender'] = gender;
    data['dob'] = dob;
    data['firebaseUid'] = firebaseUid;
    data['firebaseSignInProvider'] = firebaseSignInProvider;
    data['active'] = active;
    data['isDeleted'] = isDeleted;
    data['__t'] = T;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class LoginModel {
/*
{
  "status": true,
  "message": "User details",
  "user": {
    "_id": "657021118c2337e8d3e2e307",
    "joiningDate": "2023-12-06T07:20:35.124Z",
    "experience": "",
    "subject": "",
    "address": "",
    "name": "John Doe",
    "email": "teacher321@gmail.com",
    "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
    "gender": "Male",
    "dob": "",
    "firebaseUid": "wpnCVSW0MwQjAtkArhznsLWSNnq1",
    "firebaseSignInProvider": "custom",
    "active": true,
    "isDeleted": false,
    "__t": "Teachers",
    "createdAt": "2023-12-06T07:21:53.404Z",
    "updatedAt": "2023-12-06T07:21:53.404Z",
    "__v": 0
  }
} 
*/

  bool? status;
  String? message;
  LoginModelUser? user;

  LoginModel({
    this.status,
    this.message,
    this.user,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    user = (json['user'] != null) ? LoginModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
