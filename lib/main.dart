import 'package:flutter/material.dart';
import 'hewan.dart';
import 'tambah_hewan.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimalListPage(),
    );
  }
}

class AnimalListPage extends StatefulWidget {
  @override
  _AnimalListPageState createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  List<Animal> animals = [];

  void addAnimal(Animal animal) {
    setState(() {
      animals.add(animal);
    });
  }

  void updateAnimal(int index, Animal updatedAnimal) {
    setState(() {
      animals[index] = updatedAnimal;
    });
  }

  void deleteAnimal(int index) {
    setState(() {
      animals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal List'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return ListTile(
            title: Text(animal.name),
            subtitle: Text(animal.scientificName),
            leading: Image.asset(animal.image),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteAnimal(index),
            ),
            onTap: () {
              // Membuka halaman AddAnimalPage dengan data yang ada
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAnimalPage(
                    onAddAnimal: (animal) => addAnimal(animal),
                    animalToEdit: animal, // Mengirim data yang ingin diedit
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnimalPage(
                onAddAnimal: (animal) => addAnimal(animal),
                animalToEdit: null, // Tidak ada data untuk diedit
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
