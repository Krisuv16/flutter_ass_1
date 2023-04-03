import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patientapp/auth/login.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:patientapp/patient/add_patient.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/patient/patient_detail.dart';
import 'package:patientapp/utils/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final dio = Dio();

  List<PatientDataList> _patientList = <PatientDataList>[];

  Future fetchrequests() async {
    var url = base_url + patients;
    var response = await dio.get(url);
    if (response.statusCode == 200) {
      PatientModel model = PatientModel.fromJson(response.data);
      _patientList = model.posts!;
      setState(() {});
      return _patientList;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    fetchrequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: GlobalAppBar(
              callback: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear().whenComplete(() => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage())));
              },
              title: "Logout"),
        ),
        body: Column(
          children: [
            const Text(
              "Patients",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: fetchrequests(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PatientDataUI(patientList: _patientList);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                } else if (snapshot.data == []) {
                  return const SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Empty data"),
                    ),
                  );
                } else {
                  return const SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Something went wrong"),
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPatient(
                            total: _patientList.length,
                          )));
                },
                child: const Text("Add New Patient"))
          ],
        ),
      ),
    );
  }
}

class PatientDataUI extends StatelessWidget {
  const PatientDataUI({
    Key? key,
    required List<PatientDataList> patientList,
  })  : _patientList = patientList,
        super(key: key);

  final List<PatientDataList> _patientList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PatientDetails(
                        model: _patientList[index],
                      )))),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name : ${_patientList[index].fullName!}"),
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
                      Text("Date of Birth : ${_patientList[index].dob!}"),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
