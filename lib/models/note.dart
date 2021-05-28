class Note {
  final String title;
  final String text;
  DateTime lastModified = DateTime.now();

  Note({this.title = '', this.text = '', required this.lastModified});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['title'] = title;
    m['text'] = title;
    m['lastModified'] = lastModified.toString();

    return m;
  }
}
