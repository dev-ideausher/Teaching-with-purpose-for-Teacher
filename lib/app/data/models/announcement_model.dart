///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class AnnouncementModelData {
/*
{
  "_id": "657bf16531f6534abf969ced",
  "name": "Sample Announcement",
  "date": "2023-12-15T06:25:33.193Z",
  "postedBy": "John Doe",
  "desc": "This is a sample announcement description",
  "isDeleted": false,
  "createdAt": "2023-12-15T06:25:41.588Z",
  "updatedAt": "2023-12-15T08:06:11.136Z",
  "__v": 0
} 
*/

  String? Id;
  String? name;
  String? date;
  String? postedBy;
  String? desc;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? V;

  AnnouncementModelData({
    this.Id,
    this.name,
    this.date,
    this.postedBy,
    this.desc,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.V,
  });
  AnnouncementModelData.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    name = json['name']?.toString();
    date = json['date']?.toString();
    postedBy = json['postedBy']?.toString();
    desc = json['desc']?.toString();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    V = json['__v']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['name'] = name;
    data['date'] = date;
    data['postedBy'] = postedBy;
    data['desc'] = desc;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = V;
    return data;
  }
}

class AnnouncementModel {
/*
{
  "status": true,
  "result": 6,
  "data": [
    {
      "_id": "657bf16531f6534abf969ced",
      "name": "Sample Announcement",
      "date": "2023-12-15T06:25:33.193Z",
      "postedBy": "John Doe",
      "desc": "This is a sample announcement description",
      "isDeleted": false,
      "createdAt": "2023-12-15T06:25:41.588Z",
      "updatedAt": "2023-12-15T08:06:11.136Z",
      "__v": 0
    }
  ]
} 
*/

  bool? status;
  int? result;
  List<AnnouncementModelData?>? data;

  AnnouncementModel({
    this.status,
    this.result,
    this.data,
  });
  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <AnnouncementModelData>[];
  v.forEach((v) {
  arr0.add(AnnouncementModelData.fromJson(v));
  });
    data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['result'] = result;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['data'] = arr0;
    }
    return data;
  }
}
