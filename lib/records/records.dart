import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/records/add_record.dart';
import 'package:patientapp/records/model/patient_records.model.dart';
import 'package:patientapp/records/record_detail.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key, this.dataList}) : super(key: key);
  final PatientDataList? dataList;

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final dio = Dio();

  List<RecordModel> _patientRecordListModel = <RecordModel>[];

  Future<List<RecordModel>> _fetchrequests(id) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var url = base_url + viewPatientRecords + id;
    var response = await dio.get(url,
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      PatientRecordListModel model =
          PatientRecordListModel.fromJson(response.data);
      _patientRecordListModel = model.data!;
      setState(() {});
      return _patientRecordListModel;
    } else {
      return [];
    }
  }

  @override
  void initState() {
    _fetchrequests(widget.dataList?.patientId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PatientDetails(
                      model: widget.dataList!,
                    ))),
            title: widget.dataList!.fullName ?? ""),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text(
            "Records",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              size: 65,
            ),
          ),
          Text(
            widget.dataList!.fullName ?? "",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Info(
              firstField: "Patient ID",
              secondField: widget.dataList!.patientId ?? ""),
          Info(firstField: "Age", secondField: widget.dataList!.age ?? ""),
          Info(
              firstField: "Contact",
              secondField: widget.dataList!.phoneNumber ?? ""),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<RecordModel>>(
              future: _fetchrequests(widget.dataList!.patientId!.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PatientRecordListUI(
                      dataList: widget.dataList,
                      patientRecordListModel: _patientRecordListModel);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Text(
                    "Empty data",
                    style: TextStyle(color: Colors.amber),
                  );
                } else {
                  return const SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Something went wrong"),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddRecord(
                            dataList: widget.dataList!,
                          )));
                },
                child: const Text("Add New Record")),
          )
        ],
      ),
    ));
  }
}

class PatientRecordListUI extends StatelessWidget {
  const PatientRecordListUI({
    Key? key,
    required List<RecordModel> patientRecordListModel,
    required this.dataList,
  })  : _patientRecordListModel = patientRecordListModel,
        super(key: key);

  final List<RecordModel> _patientRecordListModel;
  final PatientDataList? dataList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _patientRecordListModel.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecordDetails(
                    dataList: dataList!,
                    patientRecordListModel: _patientRecordListModel[index],
                  ))),
          child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Record:\n$index",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  title: Center(child: Text("0$index-12-2023")),
                ),
              )),
        ),
      ),
    );
  }
}
