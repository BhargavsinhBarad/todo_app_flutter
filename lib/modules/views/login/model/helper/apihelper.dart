import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class apihelper {
  apihelper._();
  static final apihelper api = apihelper._();

  Future<bool?> getdata({required String email, required password}) async {
    String api = "https://myhealth.hiteck-consulting.com/api/login.php";
    var ans = await http.get(Uri.parse(api));
    if (ans.statusCode == 200) {
      var body = ans.body;
      Map mapdata = jsonDecode(body);
      List apidata = mapdata['data'];
      log(apidata[2]['email']);
      bool login =
          apidata.any((e) => e['email'] == email && e['password'] == password);
      return login;
    } else {
      return null;
    }
  }
}
