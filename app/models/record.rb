class Record

	# Returns an array containing user information from the storage file
	#
	# name -> string containing the user's name
	#
	def Record.getRecords(name)
		file = File.open("records.txt", "r")
		i=0
		entries=[]
		while (line=file.gets)
			line = line.split(",")
			if line[0]==name
				entries[i]=[]
				entries[i][0]=line[1]
				entries[i][1]=line[2].split(";")
				entries[i][2]=line[3]
				i+=1
			end
		end
		file.close
		return entries
	end

	# Deletes all lines containing user's name in the storage file
	#
	# name -> string containing the user's name
	#
	def Record.deleteRecords(name)
		oldFile = File.open("records.txt", "r")
		goodLines = []
		while (line=oldFile.gets)
			if line.split(",")[0]!=name
				goodLines.push(line)
			end
		end
		oldFile.close
		newFile = File.open("records.txt", "w")
		for line in goodLines
			newFile.puts line
		end
		newFile.close
	end

	# Writes a record to the storage file
	#
	# name -> string containing the user's name
	# answers -> an array containing the user's answers
	# diagnosis -> string containing the diagnosis
	#
	def Record.saveRecord(name, diagnosis)
		records = File.open("records.txt", "a")
		theRecord = name
		theRecord+=","+Time.now.getutc.to_s
		symptoms = Record.diseaseSymptoms(diagnosis)
		theRecord+=","
		if !symptoms.nil?
			for symp in symptoms
				theRecord+=symp + ";"
			end
		end
#		theRecord+=","+Record.getQuestion(answers)
		theRecord+=","+diagnosis+"\n"
		records.puts theRecord
		records.close
	end

	# Gets the user's symptoms based on their answers
	#
	# answers -> an array containing the user's answers
	#
	def Record.getQuestion(answers)
		symptoms = ""
		for i in 0..answers.length-1
			if answers[i]
				puts i
				if i==0
					symptoms+="Cough;"
				elsif i==1
					symptoms+="Productive Cough;"
				elsif i==2
					symptoms+="Headache;"
				elsif i==3
					symptoms+="Headache on one side;"
				elsif i==4
					symptoms+="Rash;"
				elsif i==5
					symptoms+="Rash on face"
				end
			end
		end
		return symptoms
	end

	################NEW STUFF###################

	# Returns the symptom at a line number
	#
	# line -> line number of the symptom
	#
	def Record.getSymptom(line)
		file = File.open("symptoms.txt", "r")
		line.times {file.gets()}
		symptom = file.gets().split(",")[0]
		file.close()
		return symptom
	end

	# Returns the question at a line number
	#
	# line -> line number of the question
	#
	def Record.getQuestion(line)
		file = File.open("symptoms.txt", "r")
		line.times {file.gets()}
		question = file.gets().split(",")[1]
		file.close()
		return question
	end

	# Returns line number of symptom or question
	#
	# entry -> string of symptom or question
	#
	def Record.lineOf(entry)
		file = File.open("symptoms.txt", "r")
		i=0
		while (line=file.gets)
			line=line.split(",")
			if (line[0]==entry)||(line[1]==entry)
				file.close()
				return i
			end
			i+=1
		end
	end

	# Returns line number of disease
	#
	# disease -> string containing disease
	#
	def Record.diseaseLine(disease)
		file = File.open("diseases.txt")
		i=0
		while (line=file.gets)
			line=line.split(",")
			if (line[0]==disease)
				file.close()
				return i
			end
			i+=1
		end
	end

	# Returns an array of strings of symptoms for a disase
	#
	# disease -> string containing disease
	#
	def Record.diseaseSymptoms(disease)
		file = File.open("diseases.txt")
		i=0
		while (line=file.gets)
			line=line.split(",")
			if (line[0]==disease)
				file.close()
				if !line[1].nil?
					symptoms = line[1].split(";")
					for j in 0..symptoms.length-1
						symptoms[j]=Record.getSymptom(symptoms[j].to_i)
					end
				end
				return symptoms
			end
			i+=1
		end
	end

	# Returns disease at line number
	#
	# line -> line number of disease
	#
	def Record.getDisease(line)
		file = File.open("diseases.txt", "r")
		line.times {file.gets()}
		disease = file.gets().split(",")[0]
		file.close()
		return disease
	end

	# Returns an array of line numbers of symptoms for a disease
	#
	# line -> line number of disease
	#
	def Record.diseaseSymptomsLine(line)
		file = File.open("diseases.txt", "r")
		line.times {file.gets()}
		symptoms = file.gets().split(",")[1]
		if !symptoms.nil?
			symptoms = symptoms.split(";")
		end
		file.close()
		return symptoms
	end
end

puts Record.diseaseSymptomsLine(3)