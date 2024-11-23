import 'package:flutter/material.dart';
import 'tambah_hewan.dart';  // Import halaman tambah hewan
import 'daftar_hewan.dart';  // Import halaman daftar hewan
import 'hewan.dart';  // Import model Hewan

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Hewan',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hewan> daftarHewan = [];

  // Fungsi untuk menambahkan hewan
  void _addHewan(Hewan hewan) {
    setState(() {
      daftarHewan.add(hewan);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hewan Galeri'),
      ),
      body: DaftarHewanPage(daftarHewan: daftarHewan),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman tambah hewan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahHewanPage(onAddHewan: _addHewan),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
