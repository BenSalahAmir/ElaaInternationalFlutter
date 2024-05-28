import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medica/models/Notification.dart';

class NotificationService {
  final String apiUrl = 'http://10.0.2.2:9098/api/notifications';



  Future<List<Notification>> getNotifications(String userId) async {
    final response = await http.get(Uri.parse('$apiUrl/user/$userId'));
    print("this userid connecter"+userId);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((notification) => Notification.fromJson(notification)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> markAsRead(String id) async {
    final response = await http.put(Uri.parse('$apiUrl/$id/read'));

    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification as read');
    }
  }
}
