class MockApi {

  /*
  Example usage in another file:

  // Fetch regattas using MockApi
  Future<void> fetchRegattas() async {
    List<dynamic> regattasData = await MockApi().fetchRegattaList();

    regattasData.sort((a, b) {
      DateTime dateA = DateTime.parse(a['start_date']);
      DateTime dateB = DateTime.parse(b['start_date']);
      return dateA.compareTo(dateB);
    });

    final now = DateTime.now();

    upcomingRegattas = [];
    pastRegattas = [];

    for (var regatta in regattasData) {
      DateTime startDate = DateTime.parse(regatta['start_date']);
      if (startDate.isAfter(now) || startDate.isAtSameMomentAs(now)) {
        upcomingRegattas.add(Regatta.fromJson(regatta));
      } else {
        pastRegattas.add(Regatta.fromJson(regatta));
      }
    }
    // Reverse pastRegattas so most recent is first
    pastRegattas = pastRegattas.reversed.toList();
  }
  */

  Future<List<dynamic>> fetchRegattaList() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return [
          {
            "id": 1,
            "name": "Cedarfest",
            "start_date": "2026-04-20",
            "duration": 2,
            "report_time": "08:30",
            "venue": "Lake Lansing Yacht Club",
            "type": "Fleet Racing",
            "participation": "Fundamental",
            "scoring": "Navy",
            "host": "Michigan State University"
          },
          {
            "id": 2,
            "name": "Emma B. Memorial Regatta",
            "start_date": "2026-05-10",
            "duration": 3,
            "report_time": "09:00",
            "venue": "Macatawa Bay Yacht Club",
            "type": "Match Racing",
            "participation": "Regional",
            "scoring": "Navy",
            "host": "Hope College"
          },
          {
            "id": 3,
            "name": "Fall Fury",
            "start_date": "2026-09-15",
            "duration": 2,
            "report_time": "07:45",
            "venue": "Lake Mendota",
            "type": "Team Racing",
            "participation": "Cross Regional",
            "scoring": "Navy",
            "host": "University of Wisconsin Madison"
          },
          {
            "id": 4,
            "name": "Hoosier Daddy",
            "start_date": "2024-03-30",
            "duration": 1,
            "report_time": "08:00",
            "venue": "Somewhere in Indiana",
            "type": "Fleet Racing",
            "participation": "Open",
            "scoring": "Navy",
            "host": "Indiana University"
          },
          {
            "id": 5,
            "name": "Laker Showdown",
            "start_date": "2024-06-20",
            "duration": 3,
            "report_time": "09:15",
            "venue": "Macatawa Bay Yacht Club",
            "type": "Match Racing",
            "participation": "Invitational",
            "scoring": "Navy",
            "host": "Grand Valley University"
          },
          {
            "id": 6,
            "name": "Cream City Classic",
            "start_date": "2024-08-05",
            "duration": 2,
            "report_time": "08:30",
            "venue": "Lake Michigan",
            "type": "Team Racing",
            "participation": "Open",
            "scoring": "Navy",
            "host": "Marquette University"
          }
        ];
    });
  }

  Future<Map<String, dynamic>> fetchRegattaDetails(int id) async {
    return await Future.delayed(Duration(seconds: 1), () {
      // Return fake detailed information for the regatta with the given id
      return {
        "id": id,
        "name": "Cedarfest",
        "start_date": "2024-06-01",
        "duration": 4,
        "report_time": "07:30",
        "venue": "Bay Area",
        "type": "Team Racing",
        "participation": "Open",
        "scoring": "Navy",
        "host": "Sail Club C",
        "description": "Detailed information about Regatta $id."
      };
    });
  }
}
