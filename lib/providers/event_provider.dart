import 'package:event_pulse/models/event_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/event_repository.dart';

final eventProvider = FutureProvider<List<EventModel>>((ref) async {
  return EventRepository().fetchEvents();
});
