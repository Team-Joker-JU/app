import 'package:http/http.dart' as http;
import 'dart:convert';

// class MowerStatus {
//   final int userId;
//   final int id;
//   final String title;

//   MowerStatus({@required this.userId, @required this.id, @required this.title});

//   factory MowerStatus.fromJson(Map<String, dynamic> json) {
//     return MowerStatus(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }


class ApiHandler {

  Future<void> fetchData() async {
    final response = await http.get(Uri.http('ims_api.supppee.workers.dev', 'api/example'));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to get data");
      throw Exception('Failed to get data');
    }
  }
}
