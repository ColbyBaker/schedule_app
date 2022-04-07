class Event {
  String title;
  late DateTime dateTime;
  String location;
  String description;

  Event(
      {this.title = '',
      required this.dateTime,
      this.location = '',
      this.description = ''});
}
