///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AddMarksModel {
/*
{
  "subject": "Mathmatics",
  "class": "8-A",
  "studentId": "609c34e92a136482c3e25b45",
  "examType": "yearly",
  "marks": 85,
  "grade": "A",
  "passOrFail": "pass"
} 
*/

  String? subject;
  String? theClass;
  String? studentId;
  String? examType;
  int? marks;
  String? grade;
  String? passOrFail;

  AddMarksModel({
    this.subject,
    this.theClass,
    this.studentId,
    this.examType,
    this.marks,
    this.grade,
    this.passOrFail,
  });
  AddMarksModel.fromJson(Map<String, dynamic> json) {
    subject = json['subject']?.toString();
    theClass = json['class']?.toString();
    studentId = json['studentId']?.toString();
    examType = json['examType']?.toString();
    marks = json['marks']?.toInt();
    grade = json['grade']?.toString();
    passOrFail = json['passOrFail']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['subject'] = subject;
    data['class'] = theClass;
    data['studentId'] = studentId;
    data['examType'] = examType;
    data['marks'] = marks;
    data['grade'] = grade;
    data['passOrFail'] = passOrFail;
    return data;
  }
}