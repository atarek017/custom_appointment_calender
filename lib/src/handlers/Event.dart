class Event {
  late int listIndex=0;
  late String title;
  late String description;
  late String dateTime;
  late Function onTap;
  late Function onLongPress;
  final String time, status, statusId;

  Event({
    title,
    description,
    dateTime,
    onTap(int listIndex)?,
    onLongPress,
    required this.time,
    required this.status,
    required this.statusId}) {
    this.title = title ?? '';
    this.description = description ?? '';
    this.dateTime = dateTime ?? '';
    this.onTap = onTap ??
            (int listIndex) {
          // print('Tap ' + listIndex.toString());
        };
    this.onLongPress = onLongPress ??
            (int listIndex) {
          // print('LongPress ' + listIndex.toString());
        };
  }
}