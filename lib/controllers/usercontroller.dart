import 'package:fudge_finance/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController extends GetxController {
  RxList<UserModel> users = RxList<UserModel>();

  @override
  void onInit() {
    fetchTopUsers();
    super.onInit();
  }

  Future<void> fetchTopUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      users.value =
          data.map((userJson) => UserModel.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to fetch top users');
    }
  }
}
