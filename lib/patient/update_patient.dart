import 'package:flutter/material.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/utils/custom_textfield.dart';

class UpdatePatient extends StatelessWidget {
  const UpdatePatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PatientDetails())),
            title: "Patient 1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                size: 65,
              ),
            ),
            const Text(
              "Edit Patient 1",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(hint: "Name", label: "Name"),
            const CustomTextField(hint: "Age", label: "Age"),
            const CustomTextField(hint: "Address", label: "Address"),
            const CustomTextField(
                hint: "Date of Birth", label: "Date of Birth"),
            const CustomTextField(hint: "Phone Number", label: "Phone Number"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PatientDetails()));
                  },
                  child: const Text("Update")),
            ),
          ],
        ),
      ),
    ));
  }
}
