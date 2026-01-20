
void main() async {
  print("===== EXERCISE 1: BASIC SYNTAX & DATA TYPES =====");
  exercise1();

  print("\n===== EXERCISE 2: COLLECTIONS & OPERATORS =====");
  exercise2();

  print("\n===== EXERCISE 3: CONTROL FLOW & FUNCTIONS =====");
  exercise3();

  print("\n===== EXERCISE 4: INTRO TO OOP =====");
  exercise4();

  print("\n===== EXERCISE 5: ASYNC, NULL SAFETY & STREAMS =====");
  await exercise5();
}

//////////////////////////////////////////////////
// Exercise 1 – Basic Syntax & Data Types
//////////////////////////////////////////////////
void exercise1() {
  String studentName = "Nguyen Ngoc Diep";
  int birthYear = 2003;
  double height = 1.53;
  bool isGraduated = false;

  // Calculate age
  int currentYear = 2026;
  int age = currentYear - birthYear;

  print("Student name: $studentName");
  print("Birth year: $birthYear");
  print("Age: $age");
  print("Height: $height m");
  print("Graduated: $isGraduated");

  bool isAdult = age >= 18;
  print("Is adult: $isAdult");
}

//////////////////////////////////////////////////
// Exercise 2 – Collections & Operators
//////////////////////////////////////////////////
void exercise2() {
  //List
  List<int> numbers = [10,20,30,40,50];

  print("First number: ${numbers[0]}");
  print("Third number: ${numbers[2]}");
  int sum = numbers[0] + numbers[1];
  bool isEqual = numbers[0] == numbers[1];
  bool logicCheck = (numbers[2] > 2) && (numbers[3] < 10);

  print("Sum: $sum");
  print("Equal: $isEqual");
  print("Logic check: $logicCheck");

  // Set
  Set<int> uniqueNumbers = {1, 2, 2, 3};
  uniqueNumbers.add(4);
  uniqueNumbers.remove(1);
  print("Set: $uniqueNumbers");

  // Map
  Map<String, int> scores = {
    "Math": 90,
    "English": 85
  };

  scores["Science"] = 88;
  print("Scores: $scores");

  // Ternary operator
  String result = sum > 5 ? "Greater than 5" : "Less or equal to 5";
  print(result);
}

//////////////////////////////////////////////////
// Exercise 3 – Control Flow & Functions
//////////////////////////////////////////////////
void exercise3() {
  // check score
  int score = 75;
  if(score >= 85){
    print("Grade A");
  }else if(score >= 70){
    print("Grade B");
  }else{
    print("Grade C");
  }

  //switch case for day of week
  int day = 3;
  switch (day){
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    default:
      print("Orther day");
      break;
  }

  // loops
  for (int i = 0; i < 3; i++) {
    print("for loop: $i");
  }

  List<String> fruits = ["Apple", "Banana", "Orange"];

  for (var fruit in fruits) {
    print("for-in: $fruit");
  }

  fruits.forEach((fruit) {
    print("forEach: $fruit");
  });

  // normal function
  int add(int a, int b) {
    return a + b;
  }

// arrow function
  int multiply(int a, int b) => a * b;

  // functions
  print("Add: ${add(3, 4)}");
  print("Multiply: ${multiply(3, 4)}");
}

//////////////////////////////////////////////////
// Exercise 4 – Intro to OOP
//////////////////////////////////////////////////
void exercise4() {
  Car car1 = Car(
    id: "C01",
    name: "Model S",
    brand: "Tesla",
    year: 2023,
    type: "Electric",
  );

  Car car2 = Car.unknown();

  ElectricCar car3 = ElectricCar( id: "E01", name: "Leaf", brand: "Nissan", year: 2022, batteryLevel: 85, );

  car1.Print();
  car2.Print();
  car3.Print();
}

// Base class
class Car {
  final String id;
  final String name;
  final String brand;
  final int year;
  final String type;

  Car({
    required this.id,
    required this.name,
    required this.brand,
    this.year = 0,
    required this.type,
  });

  Car.unknown()
      : id = "000",
        name = "Unknown",
        brand = "Unknown",
        year = 0,
        type = "Unknown";

  void Print(){
    print("id: $id, name: $name, brand: $brand, year: $year, type: $type");
  }
}

class ElectricCar extends Car{
  final int batteryLevel;

  ElectricCar({
    required String id,
    required String name,
    required String brand,
    int year = 0,
    required this.batteryLevel,
  }):super(
    id: id,
    name: name,
    brand: brand,
    year: year,
    type: "Electric",
  );
  @override
  void Print(){
    print( "id: $id, name: $name, brand: $brand, year: $year, type: $type, battery: $batteryLevel%");
  }
}

//////////////////////////////////////////////////
// Exercise 5 – Async, Null Safety & Streams
//////////////////////////////////////////////////
Future<void> exercise5() async {
  // Async / await with Future
  print("Loading data...");
  String result = await loadData();
  print(result);

  // Null safety
  String? nullableName;
  print("Nullable value: ${nullableName ?? 'Default Name'}");

  nullableName = "Dart Student";
  print("Forced unwrap: ${nullableName!}");

  // Stream
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);
  await for (int value in numberStream) {
    print("Stream value: $value");
  }
}

// Async function
Future<String> loadData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded successfully!";
}