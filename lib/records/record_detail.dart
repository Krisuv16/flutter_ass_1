import 'package:flutter/material.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/records/update_record.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';

class RecordDetails extends StatelessWidget {
  const RecordDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RecordPage())),
            title: "Records"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Record 4",
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
              "Patients A",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Info(
              firstField: "Patient ID",
              secondField: "XX9677",
            ),
            const Info(
              firstField: "Medical Status",
              secondField: "Great",
            ),
            const Info(
              firstField: "Date",
              secondField: "02-12-2023",
            ),
            const Info(
              firstField: "Time",
              secondField: "12:00 PM",
            ),
            const Info(
                firstField: "Blood Pressure", secondField: "120/90 mmHg"),
            const Info(firstField: "Respiration Rate", secondField: "22/min"),
            const Info(firstField: "O2 Level", secondField: "90%"),
            const Info(firstField: "Heart Rate", secondField: "97%"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UpDateRecord()));
                  },
                  child: const Text("Edit Record")),
            ),
          ],
        ),
      ),
    ));
  }
}
