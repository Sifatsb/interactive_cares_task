class Course {
  final String id;
  final String title;
  final String onlineVideoLink;
  final String description;
  final String thumbnail;

  Course({
    required this.id,
    required this.title,
    required this.onlineVideoLink,
    required this.description,
    required this.thumbnail,
  });
}

class Module {
  final String title;
  final String onlineVideoLink;

  Module({required this.title, required this.onlineVideoLink});
}

class Bookmark {
  final String module;
  final double time;

  Bookmark({required this.module, required this.time});
}
