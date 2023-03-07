import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/auth/login.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/add_patient.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/utils/app_bar.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final dio = Dio();

  List<PatientDataList> _patientList = <PatientDataList>[];

  fetchrequests() async {
    var url = base_url + patients;
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      PatientModel model = PatientModel.fromJson(response.data);
      _patientList = model.posts!;
      setState(() {});
    } else {
      print('A network error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchrequests();
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
                  itemCount: _patientList.length,
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
                          child:
                              Text("Name : ${_patientList[index].fullName!}"),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address : ${_patientList[index].address!}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Date of Birth : ${_patientList[index].dob!}"),
                            ],
                          ),
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
