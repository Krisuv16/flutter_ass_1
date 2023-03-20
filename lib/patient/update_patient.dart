import 'package:flutter/material.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/utils/custom_textfield.dart';

class UpdatePatient extends StatefulWidget {
  const UpdatePatient({Key? key, required this.patientList}) : super(key: key);

  final PatientDataList patientList;

  @override
  State<UpdatePatient> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();

  final TextEditingController _ageTextEditingController =
      TextEditingController();

  final TextEditingController _addressTextEditingController =
      TextEditingController();

  final TextEditingController _dobTextEditingController =
      TextEditingController();

  final TextEditingController _numberTextEditingController =
      TextEditingController();

  @override
  void initState() {
    _nameTextEditingController.text = widget.patientList.fullName!;
    _ageTextEditingController.text = widget.patientList.age!;
    _addressTextEditingController.text = widget.patientList.address!;
    _dobTextEditingController.text = widget.patientList.dob!;
    _numberTextEditingController.text = widget.patientList.phoneNumber!;
    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _ageTextEditingController.dispose();
    _addressTextEditingController.dispose();
    _dobTextEditingController.dispose();
    _numberTextEditingController.dispose();
    super.dispose();
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
                      model: widget.patientList,
                    ))),
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
            Text(
              widget.patientList.fullName!,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                hint: "Name",
                label: "Name",
                textEditingController: _nameTextEditingController),
            CustomTextField(
                hint: "Age",
                label: "Age",
                textEditingController: _ageTextEditingController),
            CustomTextField(
                hint: "Address",
                label: "Address",
                textEditingController: _addressTextEditingController),
            CustomTextField(
                textEditingController: _dobTextEditingController,
                hint: "Date of Birth",
                label: "Date of Birth"),
            CustomTextField(
                hint: "Phone Number",
                label: "Phone Number",
                textEditingController: _numberTextEditingController),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PatientDetails(
                              model: widget.patientList,
                            )));
                  },
                  child: const Text("Update")),
            ),
          ],
        ),
      ),
    ));
  }
}
