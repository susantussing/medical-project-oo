PATIENT

Returns an array of records for the specified patient.  Each patient record contains the patient name, the date of the diagnosis, a list of their symptoms and their diagnosis

GET api/patient?name

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


ALL

Returns an array of all patient records

GET api/patient?name=all
