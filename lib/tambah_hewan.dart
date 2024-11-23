import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'hewan.dart';  // Pastikan mengimpor model Hewan yang sudah ada

class TambahHewanPage extends StatefulWidget {
  final Function(Hewan) onAddHewan;

  TambahHewanPage({required this.onAddHewan});

  @override
  _TambahHewanPageState createState() => _TambahHewanPageState();
}

class _TambahHewanPageState extends State<TambahHewanPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _namaIlmiahController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();
  File? _image;

  // Menampilkan dialog untuk memilih gambar
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk menambahkan data hewan
  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final hewan = Hewan(
        nama: _namaController.text,
        namaIlmiah: _namaIlmiahController.text,
        deskripsi: _deskripsiController.text,
        image: _image?.path ?? '',
      );
      widget.onAddHewan(hewan); // Memanggil fungsi onAddHewan
      Navigator.pop(context); // Kembali ke halaman sebelumnya setelah menambah hewan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Hewan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Pilih Gambar
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: _image == null
                      ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),
              
              // Nama Hewan
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Hewan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama hewan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Nama Ilmiah
              TextFormField(
                controller: _namaIlmiahController,
                decoration: InputDecoration(
                  labelText: 'Nama Ilmiah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama ilmiah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Deskripsi Hewan
              TextFormField(
                controller: _deskripsiController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Hewan',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Tombol Submit
              ElevatedButton(
                onPressed: _submit,
                child: Text('Tambah Hewan'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Warna tombol
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
