import time
class StudentHashRecords:    
    d1 = {}
    iphallOfFame = 0.0
    ipCGPAFrom = 0.0
    ipCGPATo = 0.0
    opResult = ""
    opTime = ""

    def initializeHash(self): #class initialize
        self.arr = []

    def destroyHash(StudentHashRecords):#destroy hash table
        StudentHashRecords.d1.clear()

    def insertStudentRec(self, studentId, CGPA):  #insert student record
        self.d1[studentId] = CGPA

    def ReadFile(): #read text file
        start_time1 = time.time()
        with open("inputPS12.txt", "r+") as f: 
            data = f.readlines()
        for line in data:
            words = line.split("/")
            StudentHashRecords.insertStudentRec(StudentHashRecords, words[0],words[1].replace("\n", ""))
        StudentHashRecords.writetoAnalysisOutputFile("w","Time taken to read inputPS12.txt: %s seconds" % (time.time() - start_time1))
        #print(StudentHashRecords.opTime)
        #print(StudentHashRecords.d1)

    def ReadPromptFile(): #read text file
        start_time2 = time.time()
        with open("promptsPS12.txt", "r+") as f: 
            data = f.readlines()
        for line in data:
            words = line.split(":")
            if (words[0] == "hallOfFame"):
                StudentHashRecords.iphallOfFame = float(words[1].replace("\n", "").strip())
            elif (words[0] == "courseOffer"):
                StudentHashRecords.ipCGPAFrom = float(words[1].replace("\n", "").strip())
                StudentHashRecords.ipCGPATo = float(words[2].replace("\n", "").strip())
        StudentHashRecords.writetoAnalysisOutputFile("a","\nTime taken to read promptsPS12.txt: %s seconds" % (time.time() - start_time2))
        #print(iphallOfFame)
        #print(ipCGPAFrom)
        #print(ipCGPATo)

    def writetoOutputFile(): #write to text file
        start_time3 = time.time()
        f = open("outputPS12.txt", "w")
        f.write(StudentHashRecords.opResult)
        f.close()
        StudentHashRecords.writetoAnalysisOutputFile("a","\nTime taken to write to outputPS12.txt: %s seconds" % (time.time() - start_time3))

    def writetoAnalysisOutputFile(mode,value): #write to text file
        f = open("analysisPS12.txt", mode)
        f.write(value)
        f.close()

    def hallOfFame(StudentHashRecords,ReqCGPA):#Hall of fame function
        #print(StudentHashRecords.iphallOfFame)
        #print(ReqCGPA)
        start_time4 = time.time()
        studentIdsHallOfFame = ""
        qualifiedStudents = 0
        for (key, value) in StudentHashRecords.d1.items():
            #print(key)
            #print(value)
            if float(value) >= ReqCGPA:
                #print(ele)
                qualifiedStudents += 1
                studentIdsHallOfFame += key + "/" + str(float(value))
                studentIdsHallOfFame += "\n"
        StudentHashRecords.opResult = "---------- hall of fame ----------\n"
        StudentHashRecords.opResult += "CGPA: " + str(ReqCGPA)
        StudentHashRecords.opResult += "\nTotal eligible students: " + str(qualifiedStudents)
        StudentHashRecords.opResult +="\nQualified students:\n"
        StudentHashRecords.opResult += studentIdsHallOfFame
        #print("---------- hall of fame ----------")
        #print("Total eligible students: " + str(qualifiedStudents))
        #print("Qualified students:")
        #print(studentIdsHallOfFame)
        StudentHashRecords.writetoAnalysisOutputFile("a","\nExecution time hallOfFame: %s seconds" % (time.time() - start_time4))
    
    def newCourseList(StudentHashRecords, CGPAFrom, CPGATo):#new course function
        start_time5 = time.time()
        studentIdsnewCourseList = ""
        qualifiedStudents = 0
        for (key, value) in StudentHashRecords.d1.items():
            #print(key)
            #print(value)
            if (float(value) >= CGPAFrom) and (float(value) <= CPGATo):
                #print(ele)
                qualifiedStudents += 1
                studentIdsnewCourseList += key + "/" + str(float(value))
                studentIdsnewCourseList += "\n"
        StudentHashRecords.opResult += "\n\n"
        StudentHashRecords.opResult += "---------- new course candidates ----------\n"
        StudentHashRecords.opResult += "Input: " + str(CGPAFrom) + " to " + str(CPGATo)
        StudentHashRecords.opResult += "\nTotal eligible students: " + str(qualifiedStudents)
        StudentHashRecords.opResult += "\nQualified students:\n"
        StudentHashRecords.opResult += studentIdsnewCourseList
        StudentHashRecords.opResult += "\n\n"
        #print("---------- new course candidates ----------")
        #print("Input: " + str(CGPAFrom) + " to " + str(CPGATo))
        #print("Total eligible students: " + str(qualifiedStudents))
        #print("Qualified students:")
        #print(studentIdsnewCourseList)
        StudentHashRecords.writetoAnalysisOutputFile("a","\nExecution time newCourseList: %s seconds" % (time.time() - start_time5))

    def getDistinctCourses(StudentHashRecords):#get distinct list of courses function
        distinctCourses = []
        currentcourse = ''
        lastcurse =''
        for (key, value) in StudentHashRecords.d1.items():
            currentcourse = key.replace(key[:4],'')[:3]
            #print(currentcourse)
            if (currentcourse != lastcurse):
                if (currentcourse not in distinctCourses):
                    distinctCourses.append(currentcourse)
                lastcurse = currentcourse
        return distinctCourses

    def AverageorMax(lst, type): #AVG or Max function
        if (type=="avg"):
            return sum(lst) / len(lst) 
        else:
            return max(lst)

    def depAvg(StudentHashRecords): #get avg by course function
        start_time6 = time.time()
        distinctCourses = StudentHashRecords.getDistinctCourses(StudentHashRecords)
        StudentHashRecords.opResult += "---------- department CGPA ----------"
        #print("---------- department CGPA ----------")
        for x in distinctCourses:
            #print(x)
            lstGPA = []
            maxCGPA = []
            for (key, value) in StudentHashRecords.d1.items():
                currentcourse = key.replace(key[:4],'')[:3]
                if (currentcourse == x):
                    lstGPA.append(float(value))
            StudentHashRecords.opResult += "\n" + x +": max: " + str(StudentHashRecords.AverageorMax(lstGPA,"max")) + ", avg:" + str(StudentHashRecords.AverageorMax(lstGPA,"avg"))
            #print(x +": max: " + str(StudentHashRecords.AverageorMax(lstGPA,"max")) + ", avg:" + str(StudentHashRecords.AverageorMax(lstGPA,"avg")))
        StudentHashRecords.writetoAnalysisOutputFile("a","\nExecution time depAvg: %s seconds" % (time.time() - start_time6))

tstart_time = time.time()
StudentHashRecords.ReadFile()
StudentHashRecords.ReadPromptFile()
#print(StudentHashRecords.iphallOfFame)
StudentHashRecords.hallOfFame(StudentHashRecords,StudentHashRecords.iphallOfFame)
StudentHashRecords.newCourseList(StudentHashRecords,StudentHashRecords.ipCGPAFrom,StudentHashRecords.ipCGPATo)
StudentHashRecords.depAvg(StudentHashRecords)
StudentHashRecords.destroyHash(StudentHashRecords)
StudentHashRecords.writetoOutputFile()
StudentHashRecords.writetoAnalysisOutputFile("a","\nTotal execution time: %s seconds" % (time.time() - tstart_time))
print("Execution completed")