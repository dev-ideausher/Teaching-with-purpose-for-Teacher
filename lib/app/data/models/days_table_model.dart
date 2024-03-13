///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class DaysTableModelSubjectTeacher {
/*
{
  "contactNumber": "9100000000",
  "_id": "657021118c2337e8d3e2e307",
  "joiningDate": "2023-12-06T07:20:35.124Z",
  "experience": "",
  "address": "",
  "name": "John Doe",
  "email": "teacher321@gmail.com",
  "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
  "gender": "Male",
  "dob": "31",
  "firebaseUid": "wpnCVSW0MwQjAtkArhznsLWSNnq1",
  "firebaseSignInProvider": "custom",
  "active": true,
  "isDeleted": false,
  "__t": "Teachers",
  "createdAt": "2023-12-06T07:21:53.404Z",
  "updatedAt": "2024-01-18T12:51:02.503Z",
  "__v": 0,
  "school": "65a52f67e6b1f330a3d7673d"
} 
*/

  String? contactNumber;
  String? Id;
  String? joiningDate;
  String? experience;
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
  String? school;

  DaysTableModelSubjectTeacher({
    this.contactNumber,
    this.Id,
    this.joiningDate,
    this.experience,
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
    this.school,
  });
  DaysTableModelSubjectTeacher.fromJson(Map<String, dynamic> json) {
    contactNumber = json['contactNumber']?.toString();
    Id = json['_id']?.toString();
    joiningDate = json['joiningDate']?.toString();
    experience = json['experience']?.toString();
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
    school = json['school']?.toString();
  }
}

class DaysTableModelSubject {
/*
{
  "icon": "",
  "_id": "657025d48c2337e8d3e2e30d",
  "subject": "Mathmatics",
  "subjectCode": "123",
  "isDeleted": false,
  "createdAt": "2023-12-06T07:42:12.551Z",
  "updatedAt": "2023-12-06T07:42:12.551Z",
  "__v": 0
} 
*/

  String? icon;
  String? Id;
  String? subject;
  String? subjectCode;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  DaysTableModelSubject({
    this.icon,
    this.Id,
    this.subject,
    this.subjectCode,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  DaysTableModelSubject.fromJson(Map<String, dynamic> json) {
    icon = json['icon']?.toString();
    Id = json['_id']?.toString();
    subject = json['subject']?.toString();
    subjectCode = json['subjectCode']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
}

class DaysTableModel {
/*
{
  "time": "10am-11am",
  "day": "monday",
  "subject": {
    "icon": "",
    "_id": "657025d48c2337e8d3e2e30d",
    "subject": "Mathmatics",
    "subjectCode": "123",
    "isDeleted": false,
    "createdAt": "2023-12-06T07:42:12.551Z",
    "updatedAt": "2023-12-06T07:42:12.551Z",
    "__v": 0
  },
  "subjectTeacher": {
    "contactNumber": "9100000000",
    "_id": "657021118c2337e8d3e2e307",
    "joiningDate": "2023-12-06T07:20:35.124Z",
    "experience": "",
    "address": "",
    "name": "John Doe",
    "email": "teacher321@gmail.com",
    "image": "https://angolazone.s3.amazonaws.com/angolazone-User-Profile-PNG-High-Quality-Image.png.crdownload",
    "gender": "Male",
    "dob": "31",
    "firebaseUid": "wpnCVSW0MwQjAtkArhznsLWSNnq1",
    "firebaseSignInProvider": "custom",
    "active": true,
    "isDeleted": false,
    "__t": "Teachers",
    "createdAt": "2023-12-06T07:21:53.404Z",
    "updatedAt": "2024-01-18T12:51:02.503Z",
    "__v": 0,
    "school": "65a52f67e6b1f330a3d7673d"
  },
  "_id": "65d3019042db28a52371cb74"
} 
*/

  String? time;
  String? day;
  DaysTableModelSubject? subject;
  DaysTableModelSubjectTeacher? subjectTeacher;
  String? Id;

  DaysTableModel({
    this.time,
    this.day,
    this.subject,
    this.subjectTeacher,
    this.Id,
  });
  DaysTableModel.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    day = json['day']?.toString();
    subject = (json['subject'] != null) ? DaysTableModelSubject.fromJson(json['subject']) : null;
    subjectTeacher = (json['subjectTeacher'] != null) ? DaysTableModelSubjectTeacher.fromJson(json['subjectTeacher']) : null;
    Id = json['_id']?.toString();
  }
}
