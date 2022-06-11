class Kitap {
  final String title;
  final String author;

  Kitap({
    required this.title,
    required this.author,
  })  : assert(title != null),
        assert(author != null);
}