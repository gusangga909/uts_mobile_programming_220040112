import 'package:flutter/material.dart';
import 'hewan.dart'; 

class AddAnimalPage extends StatefulWidget {
  final Function(Animal) onAddAnimal;
  final Animal? animalToEdit;

  AddAnimalPage({required this.onAddAnimal, this.animalToEdit});

  @override
  _AddAnimalPageState createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  late TextEditingController nameController;
  late TextEditingController scientificNameController;
  late TextEditingController descriptionController;
  late String image;

  @override
  void initState() {
    super.initState();
    if (widget.animalToEdit != null) {
      nameController = TextEditingController(text: widget.animalToEdit!.name);
      scientificNameController =
          TextEditingController(text: widget.animalToEdit!.scientificName);
      descriptionController =
          TextEditingController(text: widget.animalToEdit!.description);
      image = widget.animalToEdit!.image;
    } else {
      nameController = TextEditingController();
      scientificNameController = TextEditingController();
      descriptionController = TextEditingController();
      image = ''; // Ganti dengan gambar default atau kosong
    }
  }

  void saveAnimal() {
    final name = nameController.text;
    final scientificName = scientificNameController.text;
    final description = descriptionController.text;

    if (widget.animalToEdit == null) {
      // Menambahkan hewan baru
      final newAnimal = Animal(
        name: name,
        scientificName: scientificName,
        description: description,
        image: image, // Pastikan image sudah terisi
      );
      widget.onAddAnimal(newAnimal);
    } else {
      // Memperbarui data hewan yang ada
      final updatedAnimal = Animal(
        name: name,
        scientificName: scientificName,
        description: description,
        image: image,
      );
      widget.onAddAnimal(updatedAnimal); // Menggunakan fungsi yang sama untuk update
    }

    Navigator.pop(context); // Kembali ke halaman utama
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animalToEdit == null ? 'Add Animal' : 'Edit Animal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Animal Name'),
            ),
            TextField(
              controller: scientificNameController,
              decoration: InputDecoration(labelText: 'Scientific Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: saveAnimal,
              child: Text(widget.animalToEdit == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
