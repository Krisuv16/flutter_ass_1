import 'package:flutter/material.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PatientPage())),
            title: "Patients"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Patients 1",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.person,
              size: 65,
            ),
            const SizedBox(
              height: 20,
            ),
            const Info(
              firstField: "Patient ID",
              secondField: "XX9677",
            ),
            const Info(
              firstField: "Name",
              secondField: "Krisuv Bohara",
            ),
            const Info(
              firstField: "Age",
              secondField: "21",
            ),
            const Info(
              firstField: "Address",
              secondField: "111 Treverton Drive",
            ),
            const Info(firstField: "D.O.B", secondField: "August 03, 2001"),
            const Info(firstField: "Contact", secondField: "+1-437-267-9718"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PatientPage()));
                      },
                      child: const Text("Edit Patient")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RecordPage()));
                      },
                      child: const Text("View Records")),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
