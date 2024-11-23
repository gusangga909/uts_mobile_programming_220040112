import 'dart:io';  // Import yang diperlukan
import 'package:flutter/material.dart';
import 'hewan.dart';  // Pastikan mengimpor model Hewan yang sudah ada

class DaftarHewanPage extends StatelessWidget {
  final List<Hewan> daftarHewan;

  DaftarHewanPage({required this.daftarHewan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Hewan'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: daftarHewan.length,
        itemBuilder: (context, index) {
          final hewan = daftarHewan[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: hewan.image.isEmpty
                    ? Icon(Icons.image, size: 40, color: Colors.grey) // Menampilkan ikon jika gambar kosong
                    : Image.file(
                        File(hewan.image),  // Menggunakan File dengan benar
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
              ),
              title: Text(hewan.nama, style: TextStyle(fontSize: 18)),
              subtitle: Text(hewan.namaIlmiah),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigasi ke halaman detail atau edit
              },
            ),
          );
        },
      ),
    );
  }
}
