from fastapi import APIRouter

router = APIRouter()


@router.get("/list")
def list_regattas():
    return
    {
        "regattas": [
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
                "host": "Michigan State University",
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
                "host": "Hope College",
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
                "host": "University of Wisconsin Madison",
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
                "host": "Indiana University",
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
                "host": "Grand Valley University",
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
                "host": "Marquette University",
            },
        ]
    }
