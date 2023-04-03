import 'package:flutter/material.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/records/model/patient_records.model.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';

class RecordDetails extends StatelessWidget {
  const RecordDetails({Key? key, this.patientRecordListModel, this.dataList})
      : super(key: key);

  final PatientDataList? dataList;
  final RecordModel? patientRecordListModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RecordPage())),
            title: dataList!.fullName!),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              dataList!.fullName!,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Info(
              firstField: "Patient ID",
              secondField: dataList!.patientId!,
            ),
            const Info(
              firstField: "Medical Status",
              secondField: "Great",
            ),
            Info(
              firstField: "D.O.B",
              secondField: dataList!.dob!,
            ),
            Info(
              firstField: "Time",
              secondField: patientRecordListModel!.time!,
            ),
            Info(
                firstField: "Blood Pressure",
                secondField: patientRecordListModel!.bloodPressure!),
            Info(
                firstField: "Respiration Rate",
                secondField: patientRecordListModel!.respirationRate!),
            Info(
                firstField: "O2 Level",
                secondField: patientRecordListModel!.bloodOxygen!),
            Info(
                firstField: "Heart Rate",
                secondField: "${patientRecordListModel!.heartBeat!}%"),
            const SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => const UpDateRecord()));
            //       },
            //       child: const Text("Edit Record")),
            // ),
          ],
        ),
      ),
    ));
  }
}
