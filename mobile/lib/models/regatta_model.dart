// Represents a regatta event with an ID, name, and start date.
class Regatta {
  // Unique identifier for the regatta.
  final int id;

  // Name of the regatta.
  final String name;

  // Start date of the regatta.
  final DateTime startDate;

  // Creates a new [Regatta] instance.
  Regatta({
    required this.id,
    required this.name,
    required this.startDate,
  });

  // Creates a [Regatta] from a JSON map.
  factory Regatta.fromJson(Map<String, dynamic> json) {
    return Regatta(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
    );
  }

  // Converts the [Regatta] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate.toIso8601String(),
    };
  }
}
