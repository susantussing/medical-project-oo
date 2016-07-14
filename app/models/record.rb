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
	def Record.saveRecord(name, answers, diagnosis)
		records = File.open("records.txt", "a")
		theRecord = name
		theRecord+=","+Time.now.getutc.to_s
		theRecord+=","+Record.getQuestion(answers)
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
end