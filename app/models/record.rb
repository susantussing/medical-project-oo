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
	#
	# INCOMPLETE
	#
	def Record.saveRecord(name, diagnosis)
		records = File.open("rectest.txt", "a")
		theRecord = name
		theRecord+=","+Time.now.getutc.to_s
		#add symptoms
		theRecord+=","+diagnosis
		records.puts theRecord
		records.close
	end
end

#Record.saveRecord("COLIN", [true,true,true,true,true,true])