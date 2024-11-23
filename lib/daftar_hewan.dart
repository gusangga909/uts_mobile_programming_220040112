import 'package:flutter/material.dart';
import 'tambah_hewan.dart'; // Pastikan add_animal.dart digunakan di sini
import 'hewan.dart';

class AnimalListPage extends StatelessWidget {
  final List<Animal> animals;
  final Function(Animal) onAddAnimal;

  AnimalListPage({required this.animals, required this.onAddAnimal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hewan'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(animals[index].name),
            subtitle: Text(animals[index].scientificName),
            onTap: () {
              // Ini adalah tempat untuk membuka AddAnimalPage jika ingin menambah atau mengedit data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAnimalPage(
                    onAddAnimal: onAddAnimal,
                    animalToEdit: animals[index], // Jika ingin mengedit
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Menambahkan hewan baru
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAnimalPage(
                onAddAnimal: onAddAnimal,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
