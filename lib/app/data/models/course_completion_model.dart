///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CourseCompletionModelDataChaptersWithProgressChapterDetails {
/*
{
  "_id": "65c37f8183c0e641ebc0d6c3",
  "subjectId": "657025d48c2337e8d3e2e30d",
  "chapterName": "Algebra",
  "concept": "Quadratic Equations",
  "desc": " Quadratic equations are polynomial equations of the second degree. They are typically expressed in the form ax^2 + bx + c = 0, where a, b, and c are constants, and a ≠ 0. Solutions to quadratic equations can be found using methods like factoring, completing the square, or using the quadratic formula.",
  "video": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-SampleVideo_1280x720_1mb.mp4",
  "uploadPdf": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
  "isDeleted": false,
  "createdAt": "2024-02-07T13:02:57.226Z",
  "updatedAt": "2024-02-07T13:02:57.226Z",
  "__v": 0
} 
*/

  String? Id;
  String? subjectId;
  String? chapterName;
  String? concept;
  String? desc;
  String? video;
  String? uploadPdf;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  CourseCompletionModelDataChaptersWithProgressChapterDetails({
    this.Id,
    this.subjectId,
    this.chapterName,
    this.concept,
    this.desc,
    this.video,
    this.uploadPdf,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  CourseCompletionModelDataChaptersWithProgressChapterDetails.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    subjectId = json['subjectId']?.toString();
    chapterName = json['chapterName']?.toString();
    concept = json['concept']?.toString();
    desc = json['desc']?.toString();
    video = json['video']?.toString();
    uploadPdf = json['uploadPdf']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
}

class CourseCompletionModelDataChaptersWithProgress {
/*
{
  "chapterDetails": {
    "_id": "65c37f8183c0e641ebc0d6c3",
    "subjectId": "657025d48c2337e8d3e2e30d",
    "chapterName": "Algebra",
    "concept": "Quadratic Equations",
    "desc": " Quadratic equations are polynomial equations of the second degree. They are typically expressed in the form ax^2 + bx + c = 0, where a, b, and c are constants, and a ≠ 0. Solutions to quadratic equations can be found using methods like factoring, completing the square, or using the quadratic formula.",
    "video": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-SampleVideo_1280x720_1mb.mp4",
    "uploadPdf": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
    "isDeleted": false,
    "createdAt": "2024-02-07T13:02:57.226Z",
    "updatedAt": "2024-02-07T13:02:57.226Z",
    "__v": 0
  },
  "progress": "100.00"
} 
*/

  CourseCompletionModelDataChaptersWithProgressChapterDetails? chapterDetails;
  String? progress;

  CourseCompletionModelDataChaptersWithProgress({
    this.chapterDetails,
    this.progress,
  });
  CourseCompletionModelDataChaptersWithProgress.fromJson(Map<String, dynamic> json) {
    chapterDetails = (json['chapterDetails'] != null) ? CourseCompletionModelDataChaptersWithProgressChapterDetails.fromJson(json['chapterDetails']) : null;
    progress = json['progress']?.toString();
  }
}

class CourseCompletionModelData {
/*
{
  "overallPercentage": "100.00",
  "chaptersWithProgress": [
    {
      "chapterDetails": {
        "_id": "65c37f8183c0e641ebc0d6c3",
        "subjectId": "657025d48c2337e8d3e2e30d",
        "chapterName": "Algebra",
        "concept": "Quadratic Equations",
        "desc": " Quadratic equations are polynomial equations of the second degree. They are typically expressed in the form ax^2 + bx + c = 0, where a, b, and c are constants, and a ≠ 0. Solutions to quadratic equations can be found using methods like factoring, completing the square, or using the quadratic formula.",
        "video": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-SampleVideo_1280x720_1mb.mp4",
        "uploadPdf": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
        "isDeleted": false,
        "createdAt": "2024-02-07T13:02:57.226Z",
        "updatedAt": "2024-02-07T13:02:57.226Z",
        "__v": 0
      },
      "progress": "100.00"
    }
  ]
} 
*/

  String? overallPercentage;
  List<CourseCompletionModelDataChaptersWithProgress?>? chaptersWithProgress;

  CourseCompletionModelData({
    this.overallPercentage,
    this.chaptersWithProgress,
  });
  CourseCompletionModelData.fromJson(Map<String, dynamic> json) {
    overallPercentage = json['overallPercentage']?.toString();
  if (json['chaptersWithProgress'] != null) {
  final v = json['chaptersWithProgress'];
  final arr0 = <CourseCompletionModelDataChaptersWithProgress>[];
  v.forEach((v) {
  arr0.add(CourseCompletionModelDataChaptersWithProgress.fromJson(v));
  });
    chaptersWithProgress = arr0;
    }
  }
}

class CourseCompletionModel {
/*
{
  "status": true,
  "data": {
    "overallPercentage": "100.00",
    "chaptersWithProgress": [
      {
        "chapterDetails": {
          "_id": "65c37f8183c0e641ebc0d6c3",
          "subjectId": "657025d48c2337e8d3e2e30d",
          "chapterName": "Algebra",
          "concept": "Quadratic Equations",
          "desc": " Quadratic equations are polynomial equations of the second degree. They are typically expressed in the form ax^2 + bx + c = 0, where a, b, and c are constants, and a ≠ 0. Solutions to quadratic equations can be found using methods like factoring, completing the square, or using the quadratic formula.",
          "video": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-SampleVideo_1280x720_1mb.mp4",
          "uploadPdf": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
          "isDeleted": false,
          "createdAt": "2024-02-07T13:02:57.226Z",
          "updatedAt": "2024-02-07T13:02:57.226Z",
          "__v": 0
        },
        "progress": "100.00"
      }
    ]
  }
} 
*/

  bool? status;
  CourseCompletionModelData? data;

  CourseCompletionModel({
    this.status,
    this.data,
  });
  CourseCompletionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = (json['data'] != null) ? CourseCompletionModelData.fromJson(json['data']) : null;
  }
}