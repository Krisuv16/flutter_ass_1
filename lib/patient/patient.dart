import 'package:flutter/material.dart';
import 'package:patientapp/auth/login.dart';
import 'package:patientapp/patient/add_patient.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/utils/app_bar.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: GlobalAppBar(
              callback: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage())),
              title: "Logout"),
        ),
        body: Column(
          children: [
            const Text(
              "Patients",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) => Card(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const PatientDetails()))),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Patient $index"),
                        ),
                      ),
                    ),
                  )),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddPatient()));
                },
                child: const Text("Add New Patient"))
          ],
        ),
      ),
    );
  }
}
