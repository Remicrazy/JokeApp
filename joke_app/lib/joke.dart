class Joke {
  final String id;
  final String category;
  final String joke;
  final String setup;
  final String delivery;

  Joke({this.id, this.category, this.joke, this.setup, this.delivery});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'joke': joke,
      'setup': setup,
      'delivery': delivery,
    };
  }

  @override
  String toString() {
    return 'Joke{id: $id, category $category,joke $joke,setup $setup, delivery $delivery}';
  }

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
        id: json['id'].toString(),
        category: json['category'],
        joke: json['joke'],
        setup: json['setup'],
        delivery: json['delivery']);
  }
}
