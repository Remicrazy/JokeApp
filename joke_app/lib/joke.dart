class Joke {
  final int id;
  final String category;
  final String joke;
  final String setup;
  final String delivery;
  final String flags;

  Joke(
      {this.id,
      this.category,
      this.flags,
      this.joke,
      this.setup,
      this.delivery});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'joke': joke,
      'setup': setup,
      'delivery': delivery,
      'flags': flags,
    };
  }

  @override
  String toString() {
    return 'Joke{id: $id, category $category,joke $joke,setup $setup, delivery $delivery, flags $flags}';
  }

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      category: json['category'],
      joke: json['joke'],
      setup: json['setup'],
      delivery: json['delivery'],
      flags: json['flags'],
    );
  }
}
