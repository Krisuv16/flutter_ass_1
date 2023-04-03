import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/records/records.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:patientapp/utils/custom_textfield.dart';
import 'package:patientapp/utils/dialog_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddRecord extends StatelessWidget {
  AddRecord({Key? key, required this.dataList}) : super(key: key);
  PatientDataList dataList;
  final dio = Dio();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _dateTextEditingController =
      TextEditingController();

  final TextEditingController _timeTextEditingController =
      TextEditingController();

  final TextEditingController _bpTextEditingController =
      TextEditingController();

  final TextEditingController _respirationTextEditingController =
      TextEditingController();
  final TextEditingController _oxygenTextEditingController =
      TextEditingController();
  final TextEditingController _heartTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: GlobalAppBar(
            callback: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RecordPage())),
            title: dataList.fullName!),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              Text(
                dataList.fullName!,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  hint: "Blood Pressure",
                  label: "Blood Pressure",
                  textEditingController: _bpTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Blood Pressure Required";
                    }
                    return null;
                  }),
              CustomTextField(
                hint: "Respiration Rate",
                label: "Respiration Rate",
                textEditingController: _respirationTextEditingController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Respiration Rate Required";
                  }
                  return null;
                },
              ),
              CustomTextField(
                  hint: "O2 Level",
                  label: "O2 Level",
                  textEditingController: _oxygenTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "O2 Level Required";
                    }
                    return null;
                  }),
              CustomTextField(
                  hint: "Heart Rate",
                  label: "Heart Rate",
                  textEditingController: _heartTextEditingController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Heart Rate Required";
                    }
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onRecordAdd(
                                _timeTextEditingController.text,
                                _bpTextEditingController.text,
                                _respirationTextEditingController.text,
                                _oxygenTextEditingController.text,
                                _heartTextEditingController.text,
                                context)
                            .whenComplete(() => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => RecordPage(
                                          dataList: dataList,
                                        ))));
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

  Future onRecordAdd(String time, String bp, String respiraton, String oxy,
      String heart, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance().whenComplete(
        () => DialogUtils.showLoadingDialog(context, dismissable: false));
    var token = prefs.getString("token");
    var data = {
      "patientId": dataList.patientId,
      "time": "${DateTime.now().hour} : ${DateTime.now().minute}",
      "bloodPressure": bp,
      "respirationRate": respiraton,
      "bloodOxygen": oxy,
      "heartBeat": heart
    };
    try {
      var url = base_url + addRecord;
      var response = await dio.post(
        url,
        options: Options(contentType: "application/x-www-form-urlencoded"),
        data: data,
      );
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
}
