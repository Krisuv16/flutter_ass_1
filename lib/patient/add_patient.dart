import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/custom_textfield.dart';
import 'package:patientapp/utils/dialog_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPatient extends StatelessWidget {
  AddPatient({Key? key, this.model, required this.total}) : super(key: key);
  final PatientDataList? model;
  final int total;

  final dio = Dio();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Future onAddPatient(String name, String age, String address, String dob,
      String number, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance().whenComplete(
        () => DialogUtils.showLoadingDialog(context, dismissable: false));
    var token = prefs.getString("token");
    var data = {
      "patientId": total + 1,
      "fullName": name,
      "age": age,
      "address": address,
      "dob": dob,
      "phoneNumber": number,
    };
    try {
      var url = base_url + addPatient;
      var response = await dio.post(url,
          data: data,
          options: Options(
              headers: {"Authorization": "Bearer $token"},
              contentType: "application/x-www-form-urlencoded"));
      if (response.statusCode == 200) {
        return true;
      } else {
        Navigator.pop(context);
        return response.data['message'];
      }
    } catch (e) {
      Navigator.pop(context);
      return false;
    }
  }

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
        child: Form(
          key: _formKey,
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
              CustomTextField(
                  hint: "Name",
                  label: "Name",
                  textEditingController: _nameTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Name Required";
                    }
                    return null;
                  }),
              CustomTextField(
                  hint: "Age",
                  label: "Age",
                  textEditingController: _ageTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Age Required";
                    }
                    return null;
                  }),
              CustomTextField(
                  hint: "Address",
                  label: "Address",
                  textEditingController: _addressTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Address Required";
                    }
                    return null;
                  }),
              CustomTextField(
                  hint: "Date of Birth",
                  label: "Date of Birth",
                  textEditingController: _dobTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "DOB Required";
                    }
                    return null;
                  }),
              CustomTextField(
                  hint: "Phone Number",
                  label: "Phone Number",
                  textEditingController: _numberTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Number Required";
                    }
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onAddPatient(
                                _nameTextEditingController.text,
                                _ageTextEditingController.text,
                                _addressTextEditingController.text,
                                _dobTextEditingController.text,
                                _numberTextEditingController.text,
                                context)
                            .whenComplete(() => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) =>
                                        const PatientPage())));
                      }
                    },
                    child: const Text("Add")),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
