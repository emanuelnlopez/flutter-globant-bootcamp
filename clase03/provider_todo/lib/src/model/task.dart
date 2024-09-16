class Task {
  Task({
    this.done = false,
    int? id,
    required this.text,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  final bool done;
  final int id;
  final String text;

  Task copyWith({bool? done, int? id, String? text}) => Task(
        done: done ?? this.done,
        id: id ?? this.id,
        text: text ?? this.text,
      );
}
