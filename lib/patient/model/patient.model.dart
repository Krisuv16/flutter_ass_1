class PatientModel {
  List<PatientDataList>? posts;

  PatientModel({this.posts});

  PatientModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <PatientDataList>[];
      json['posts'].forEach((v) {
        posts!.add(PatientDataList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientDataList {
  String? sId;
  String? fullName;
  String? age;
  String? address;
  String? dob;
  String? phoneNumber;
  String? image;
  int? iV;

  PatientDataList(
      {this.sId,
      this.fullName,
      this.age,
      this.address,
      this.dob,
      this.phoneNumber,
      this.image,
      this.iV});

  PatientDataList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    age = json['age'];
    address = json['address'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullName'] = fullName;
    data['age'] = age;
    data['address'] = address;
    data['dob'] = dob;
    data['phoneNumber'] = phoneNumber;
    data['image'] = image;
    data['__v'] = iV;
    return data;
  }
}
