import 'package:flutter/material.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/custom_textfield.dart';

class AddRecord extends StatelessWidget {
  const AddRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RecordPage())),
            title: "Patient 1 Records"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Add Record",
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
              "Patient A",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
                hint: "Medical Status", label: "Medical Status"),
            const CustomTextField(hint: "Date", label: "Date"),
            const CustomTextField(hint: "Time", label: "Time"),
            const CustomTextField(
                hint: "Blood Pressure", label: "Blood Pressure"),
            const CustomTextField(
                hint: "Respiration Rate", label: "Respiration Rate"),
            const CustomTextField(hint: "O2 Level", label: "O2 Level"),
            const CustomTextField(hint: "Heart Rate", label: "Heart Rate"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RecordPage()));
                  },
                  child: const Text("Add")),
            ),
          ],
        ),
      ),
    ));
  }
}
