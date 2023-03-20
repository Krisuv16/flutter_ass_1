import 'package:flutter/material.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/records/add_record.dart';
import 'package:patientapp/records/record_detail.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key, this.dataList}) : super(key: key);
  final PatientDataList? dataList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PatientDetails(
                      model: dataList!,
                    ))),
            title: "Patient 1"),
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
          const Text(
            "Patient 1",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Info(firstField: "Patient ID", secondField: "22SS72A"),
          const Info(firstField: "Age", secondField: "22"),
          const Info(firstField: "Medical Status", secondField: "Critical"),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RecordDetails())),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddRecord()));
                },
                child: const Text("Add New Record")),
          )
        ],
      ),
    ));
  }
}
