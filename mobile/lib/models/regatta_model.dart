class Regatta {
  // Unique identifier for the regatta.
  final int id;

  // Name of the regatta.
  final String name;

  // Start date of the regatta.
  final DateTime startDate;

  final int duration;
  final String reportTime;
  final String venue;
  final String type;
  final String participation;
  final String scoring;
  final String host;

  Regatta.builder(RegattaBuilder builder)
      : id = builder._id ?? 0,
        name = builder._name ?? '',
        startDate = builder._startDate ?? DateTime.now(),
        duration = builder._duration ?? 1,
        reportTime = builder._reportTime ?? '',
        venue = builder._venue ?? '',
        type = builder._type ?? '',
        participation = builder._participation ?? '',
        scoring = builder._scoring ?? '',
        host = builder._host ?? 'TBD';

  // Creates a [Regatta] from a JSON map.
  factory Regatta.fromJson(Map<String, dynamic> json) {
    return Regatta.builder(
      RegattaBuilder()
          .setId(json['id'])
          .setName(json['name'])
          .setStartDate(DateTime.parse(json['start_date']))
          .setDuration(json['duration'] ?? '')
          .setReportTime(json['report_time'] ?? '')
          .setVenue(json['venue'] ?? '')
          .setType(json['type'] ?? '')
          .setParticipation(json['participation'] ?? '')
          .setScoring(json['scoring'] ?? '')
          .setHost(json['host'] ?? 'TBD'),
    );
  }

  // Converts the [Regatta] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate.toIso8601String(),
      'duration': duration,
      'report_time': reportTime,
      'venue': venue,
      'type': type,
      'participation': participation,
      'scoring': scoring,
      'host': host,
    };
  }
}

class RegattaBuilder {
  int? _id;
  String? _name;
  DateTime? _startDate;
  int? _duration;
  String? _reportTime;
  String? _venue;
  String? _type;
  String? _participation;
  String? _scoring;
  String? _host;

  RegattaBuilder setId(int id) {
    _id = id;
    return this;
  }

  RegattaBuilder setName(String name) {
    _name = name;
    return this;
  }

  RegattaBuilder setStartDate(DateTime startDate) {
    _startDate = startDate;
    return this;
  }

  RegattaBuilder setDuration(int duration) {
    _duration = duration;
    return this;
  }

  RegattaBuilder setReportTime(String reportTime) {
    _reportTime = reportTime;
    return this;
  }

  RegattaBuilder setVenue(String venue) {
    _venue = venue;
    return this;
  }

  RegattaBuilder setType(String type) {
    _type = type;
    return this;
  }

  RegattaBuilder setParticipation(String participation) {
    _participation = participation;
    return this;
  }

  RegattaBuilder setScoring(String scoring) {
    _scoring = scoring;
    return this;
  }

  RegattaBuilder setHost(String host) {
    _host = host;
    return this;
  }

  Regatta build() {
    return Regatta.builder(this);
  }
}
