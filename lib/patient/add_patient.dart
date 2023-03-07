import 'package:flutter/material.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/custom_textfield.dart';

class AddPatient extends StatelessWidget {
  const AddPatient({Key? key}) : super(key: key);

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
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                size: 65,
              ),
            ),
            const Text(
              "Add Patient",
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
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => PatientPage()));
                  },
                  child: const Text("Add")),
            ),
          ],
        ),
      ),
    ));
  }
}
