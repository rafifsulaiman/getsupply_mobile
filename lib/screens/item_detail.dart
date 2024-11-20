import 'package:flutter/material.dart';
import 'package:getsupply_mobile/models/supply_entry.dart';

class ItemDetailPage extends StatelessWidget {
  final SupplyEntry item;

  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menempatkan gambar di sebelah kanan teks
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Teks di sebelah kiri
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.fields.name,
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Price: Rp ${item.fields.price}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Description: ',
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(item.fields.description),
                    ],
                  ),
                ),
                // Gambar yang diletakkan di sebelah kanan
                SizedBox(width: 16.0), // Memberikan jarak antara gambar dan teks
                Container(
                  width: 120,  // Ukuran gambar
                  height: 120, // Ukuran gambar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(item.fields.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman daftar item
              },
              child: Text('Back to Item List'),
            ),
          ],
        ),
      ),
    );
  }
}
