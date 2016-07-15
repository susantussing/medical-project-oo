class Med

	def Med.getSymptom(line)
		file = File.open("symptoms.txt", "r")
		line.times {file.gets()}
		symptom = file.gets().split(",")[0]
		file.close()
		return symptom
	end

	def Med.getQuestion(line)
		file = File.open("symptoms.txt", "r")
		line.times {file.gets()}
		question = file.gets().split(",")[1]
		file.close()
		return question
	end

	def Med.lineOf(entry)
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

	def Med.diseaseLine(disease)
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

	def Med.diseaseSymptoms(disease)
		file = File.open("diseases.txt")
		i=0
		while (line=file.gets)
			line=line.split(",")
			if (line[0]==disease)
				file.close()
				symptoms = line[1].split(";")
				for j in 0..symptoms.length-1
					symptoms[j]=Med.getSymptom(symptoms[j].to_i)
				end
				return symptoms
			end
			i+=1
		end
	end
end

puts Med.diseaseSymptoms("Pneumonia")