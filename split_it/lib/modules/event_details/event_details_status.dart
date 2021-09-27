abstract class EventDetailsStatus {}

class EventDetailsStatusEmpty extends EventDetailsStatus {}

class EventDetailsStatusLoading extends EventDetailsStatus {}

class EventDetailsStatusSuccess extends EventDetailsStatus {}

class EventDetailsStatusFailure extends EventDetailsStatus {
  final String message;
  EventDetailsStatusFailure({
    required this.message,
  });
}
