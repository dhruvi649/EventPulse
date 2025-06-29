import 'dart:convert';
import 'package:event_pulse/models/event_response_model.dart';
import 'package:http/http.dart' as http;

class EventRepository {
  final _url = 'https://mockapi.io/api/v1/events'; // Replace with your real URL

  Future<List<EventModel>> fetchEvents() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => EventModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch events');
    }
  }
}
