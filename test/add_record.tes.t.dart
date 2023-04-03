import 'package:flutter_test/flutter_test.dart';
import 'package:patientapp/patient/model/patient.model.dart';
import 'package:patientapp/config/api.const.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('fetchrequests', () {
    late Dio dio;
    PatientModel? patientModel;
    List<PatientDataList>? patientList;

    setUp(() {
      dio = MockDio();
    });

    test('returns patient list when http call is successful', () async {
      final response = Response(
          data: patientModel?.posts!,
          statusCode: 200,
          requestOptions: RequestOptions(path: base_url + patients));
      when(dio.get(base_url + patients)).thenAnswer((_) async => response);

      final result = await fetchrequests(dio);
      prints(result);

      expect(result, equals(patientList));
    });
  });
}

fetchrequests(Dio dio) async {
  late List<PatientDataList> patientList;
  var url = base_url + patients;
  var response = await dio.get(url);
  PatientModel model = PatientModel.fromJson(response.data);
  patientList = model.posts!;
  return patientList;
}
