class ChaptersListModelData {
/*
{
  "_id": "6582f33957b95de3f5fcb76f",
  "subjectId": "657025d48c2337e8d3e2e30d",
  "chapterName": "Arethamatic combination",
  "concept": "values",
  "desc": "discuss about values",
  "video": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
  "uploadPdf": "https://angolazone.s3.ap-south-1.amazonaws.com/angolazone-english.pdf",
  "isDeleted": false,
  "createdAt": "2023-12-20T13:59:21.075Z",
  "updatedAt": "2023-12-20T13:59:21.075Z",
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

  ChaptersListModelData({
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
  ChaptersListModelData.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['subjectId'] = subjectId;
    data['chapterName'] = chapterName;
    data['concept'] = concept;
    data['desc'] = desc;
    data['video'] = video;
    data['uploadPdf'] = uploadPdf;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}