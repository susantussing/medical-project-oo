PATIENT

Returns an array of records for the specified patient.  Each patient record contains the patient name, the date of the diagnosis, a list of their symptoms and their diagnosis

GET api/patient?name

```
[
		{
			"name" => "John Doe",
			"date" => "2016-07-15 18:24:23 UTC",
			"diagnosis" => "Lung Cancer",
			"symptoms" => [
				"Cough",
				"Headache"
			]
		},

		{
			"name" => "John Doe",
			"date" => "2016-07-15 18:30:23 UTC",
			"diagnosis" => "Skin Cancer",
			"symptoms" => [
				"Fever",
				"Rash"
			]
		}
]
```

ALL

Returns an array of all patient records

GET api/patient?name=all

Disease API:

Lists all diseases and their symptoms in the system
GET /api/diseases

```
{
    "diseases": [
        {
            "id": 0,
            "name": "Disease 1",
            "symptoms": [
                "Symptom 1",
                "Symptom 2"
            ]
        },
        {
            "id": 1,
            "name": "Disease 2",
            "symptoms": [
                "Symptom 1",
                "Symptom 2"
            ]
        },
    ]
}
```

Get a particular disease and its symptoms
GET /api/disease/{id}

```
{
    "id": 0,
    "name": "Disease 1",
    "symptoms": [
        "Symptom 1",
        "Symptom 2"
    ]
}
```
