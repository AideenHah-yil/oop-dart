import 'dart:convert';
import 'dart:io';

abstract class Playable {
  void play();
}

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print('Generic animal sound');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print('Woof woof!');
  }
}

class Guitar implements Playable {
  @override
  void play() {
    print('Playing guitar chords...');
  }
}

void printNumbers(int count) {
  for (var i = 1; i <= count; i++) {
    print(i);
  }
}

void main() {
  var file = File('animals.json');
  var jsonString = file.readAsStringSync();
  var jsonData = json.decode(jsonString);

  for (var data in jsonData) {
    var dog = Dog(data['name'], data['age'], data['breed']);
    print('Dog: ${dog.name}, Age: ${dog.age}, Breed: ${dog.breed}');
    dog.makeSound();
  }

  printNumbers(5);
}
