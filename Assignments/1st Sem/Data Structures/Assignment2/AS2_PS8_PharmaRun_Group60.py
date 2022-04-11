from collections import defaultdict
import pandas as pd
import io
import time
class Graph():
    harshHouse = 'a'
    pharmacy1 = 'h'
    pharmacy2 = 'j'
    path1 = []
    path2= []
    totContZn1 = 0
    totContZn2 = 0
    def __init__(self):
        """
        self.edges is a dict of all possible next nodes
        e.g. {'X': ['A', 'B', 'C', 'E'], ...}
        self.weights has all the weights between two nodes,
        with the two nodes as a tuple as the key
        e.g. {('X', 'A'): 7, ('X', 'B'): 2, ...}
        """
        self.edges = defaultdict(list)
        self.weights = {}
    
    def add_edge(self, from_node, to_node, weight):
        # Note: assumes edges are bi-directional
        self.edges[from_node].append(to_node)
        self.edges[to_node].append(from_node)
        self.weights[(from_node, to_node)] = int(weight)
        self.weights[(to_node, from_node)] = int(weight)

    graph = Graph()

    def ReadFile(): #read text file
      from google.colab import files
      uploaded = files.upload()

      #df = pd.read_csv('content/drive/My Drive/BITS/inputPS8.txt')
      df = pd.read_csv(io.StringIO(uploaded['inputPS8.txt'].decode('utf-8')), header=None)
      list_of_rows = [list(row) for row in df.values]
      #print(list_of_rows)
      ##data = df.readlines()
      mincontzone1 = Graph()
      for line in list_of_rows:
        words = line[0].replace("\n", "").replace(" ", "").split("/")
        #print (line[0])
        mincontzone1.add_edge(*words)
      return mincontzone1

    def ReadFile2(): #read text file
      mincontzone1 = Graph()
      from google.colab import drive
      drive.mount('/drive')
      #df.to_csv('/drive/My Drive/Colab Notebooks/Output.txt', header=None)
      with open('/drive/My Drive/Colab Notebooks/inputPS8.txt', 'r') as readfile:
        data = readfile.readlines()
      for line in data:
        words = line.replace("\n", "").replace(" ", "").split("/")
        mincontzone1.add_edge(*words)
      return mincontzone1

    def writeoutput(outputtxt):
      #mydata =[]
      #mydata.append(outputtxt)
      #df=pd.DataFrame(mydata)
      from google.colab import drive
      drive.mount('/drive')
      #df.to_csv('/drive/My Drive/Colab Notebooks/Output.txt', header=None)
      with open('/drive/My Drive/Colab Notebooks/outputPS8.txt', 'w') as writefile:
        writefile.write(outputtxt)

    def dijsktra(graph, initial, end):
      # shortest paths is a dict of nodes
      # whose value is a tuple of (previous node, weight)
      shortest_paths = {initial: (None, 0)}
      current_node = initial
      visited = set()
      
      while current_node != end:
          visited.add(current_node)
          destinations = graph.edges[current_node]
          weight_to_current_node = shortest_paths[current_node][1]

          for next_node in destinations:
              weight = int(graph.weights[(current_node, next_node)]) + int(weight_to_current_node)
              if next_node not in shortest_paths:
                  shortest_paths[next_node] = (current_node, weight)
              else:
                  current_shortest_weight = shortest_paths[next_node][1]
                  if current_shortest_weight > weight:
                      shortest_paths[next_node] = (current_node, weight)
          
          next_destinations = {node: shortest_paths[node] for node in shortest_paths if node not in visited}
          if not next_destinations:
              return "Route Not Possible"
          # next node is the destination with the lowest weight
          current_node = min(next_destinations, key=lambda k: next_destinations[k][1])
      
      # Work back through destinations in shortest path
      path = []
      totalcontainmentZone = '0'
      while current_node is not None:
          path.append(current_node)
          next_node = shortest_paths[current_node][0]
          if (totalcontainmentZone == '0'):
            totalcontainmentZone = (shortest_paths[current_node][1])
          current_node = next_node
      # Reverse path
      path = path[::-1]
      return (str(path) + "~" + str(totalcontainmentZone))
      #print (path)

    #dijsktra(graph, 'X', 'Y')
    start_time = time.time()
    #Uncomment below code in case you want to give dynamic input
    """print ("Enter nodes between a-k for Harsha's house, Pharmacy 1 and 2. Enter blank for defaults i.e. Harsha house:a, Pharmacy1: h and Pharmacy2: j")
    harshHouse = input("Harsha house: ")
    if harshHouse.lower() not in ('','a', 'b', 'c', 'd','e', 'f', 'g', 'h','i', 'j', 'k'):
        print("Not an appropriate choice. Setting default as a")
        harshHouse = 'a'
    elif harshHouse == '':
        harshHouse = 'a'
    
    pharmacy1 = input("Pharmacy1: ")
    if pharmacy1.lower() not in ('','a', 'b', 'c', 'd','e', 'f', 'g', 'h','i', 'j', 'k'):
        print("Not an appropriate choice. Setting default as h")
        pharmacy1 = 'h'
    elif pharmacy1 == '':
        pharmacy1 = 'h'
    elif pharmacy1 == harshHouse:
        print("Harsha's house and pharmacy1 have same node.")

    pharmacy2 = input("Pharmacy2: ")
    if pharmacy2.lower() not in ('','a', 'b', 'c', 'd','e', 'f', 'g', 'h','i', 'j', 'k'):
        print("Not an appropriate choice. Setting default as j")
        pharmacy2 = 'j'
    elif pharmacy2 == '':
        pharmacy2 = 'j'
    elif pharmacy2 == harshHouse:
        print("Harsha's house and pharmacy2 have same node.")

    print("Harsha's house: " + harshHouse)
    print("Pharmacy1: " + pharmacy1)
    print("Pharmacy2: " + pharmacy2)"""
    mincontzone = ReadFile2()

    path1 = dijsktra(mincontzone, harshHouse, pharmacy1)
    path2 = dijsktra(mincontzone, harshHouse, pharmacy2)
    #print (path1)
    #print (path2)
    totContZn1 = int(path1.split("~")[1])
    totContZn2 = int(path2.split("~")[1])
    outputtxt = ""
    if (totContZn1 < totContZn2):
      outputtxt = "Safer pharmacy is: Pharmacy1 i.e." + pharmacy1
      outputtxt += "\n" + "Path to follow: " + path1.split("~")[0].replace("[", "").replace("]", "").replace("'", "")
      outputtxt += "\n" + "Containment zones on this path: " + str(totContZn1)
    else:
      outputtxt = "Safer pharmacy is: Pharmacy2 i.e." + pharmacy2
      outputtxt += "\n" + "Path to follow: " + path2.split("~")[0].replace("[", "").replace("]", "").replace("'", "")
      outputtxt += "\n" + "Containment zones on this path: " + str(totContZn2)

    print(outputtxt)
    writeoutput(outputtxt)
    end_time = time.time()
    print ("Excecution time: " + str(end_time-start_time))