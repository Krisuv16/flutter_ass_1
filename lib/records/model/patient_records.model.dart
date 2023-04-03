class PatientRecordListModel {
  List<RecordModel>? data;

  PatientRecordListModel({this.data});

  PatientRecordListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RecordModel>[];
      json['data'].forEach((v) {
        data!.add(RecordModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecordModel {
  String? sId;
  String? patientId;
  String? time;
  String? bloodPressure;
  String? respirationRate;
  String? bloodOxygen;
  String? heartBeat;
  int? iV;

  RecordModel(
      {this.sId,
      this.patientId,
      this.time,
      this.bloodPressure,
      this.respirationRate,
      this.bloodOxygen,
      this.heartBeat,
      this.iV});

  RecordModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    patientId = json['patientId'];
    time = json['time'];
    bloodPressure = json['bloodPressure'];
    respirationRate = json['respirationRate'];
    bloodOxygen = json['bloodOxygen'];
    heartBeat = json['heartBeat'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['patientId'] = patientId;
    data['time'] = time;
    data['bloodPressure'] = bloodPressure;
    data['respirationRate'] = respirationRate;
    data['bloodOxygen'] = bloodOxygen;
    data['heartBeat'] = heartBeat;
    data['__v'] = iV;
    return data;
  }
}
