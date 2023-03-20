import 'package:flutter/material.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:patientapp/patient/update_patient.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/info.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({Key? key, required this.model}) : super(key: key);

  final PatientDataList model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PatientPage())),
            title: "Patients"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.fullName ?? "",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            model.image == "" || model.image == null
                ? const Icon(
                    Icons.person,
                    size: 65,
                  )
                : Image.network(model.image!),
            const SizedBox(
              height: 20,
            ),
            Info(
              firstField: "Patient ID",
              secondField: model.sId ?? "",
            ),
            Info(
              firstField: "Name",
              secondField: model.fullName ?? "",
            ),
            Info(
              firstField: "Age",
              secondField: model.age ?? "",
            ),
            Info(
              firstField: "Address",
              secondField: model.address ?? "",
            ),
            Info(
              firstField: "D.O.B",
              secondField: model.dob ?? "",
            ),
            Info(
              firstField: "Contact",
              secondField: model.phoneNumber ?? "",
            ),
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
                            builder: (context) => UpdatePatient(
                                  patientList: model,
                                )));
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
