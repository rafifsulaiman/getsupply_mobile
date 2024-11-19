import 'package:flutter/material.dart';
import 'package:getsupply_mobile/models/supply_entry.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:getsupply_mobile/widgets/left_drawer.dart';

class SupplyEntryPage extends StatefulWidget {
  const SupplyEntryPage({super.key});

  @override
  State<SupplyEntryPage> createState() => _SupplyEntryPageState();
}

class _SupplyEntryPageState extends State<SupplyEntryPage> {
  Future<List<SupplyEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;
    List<SupplyEntry> supplyList = [];
    for (var d in data) {
      if (d != null) {
        supplyList.add(SupplyEntry.fromJson(d));
      }
    }
    return supplyList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supply Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada produk.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      snapshot.data![index].fields.image.isNotEmpty
                          ? Image.network(
                              snapshot.data![index].fields.image,
                              height: 200, // You can adjust the height or width
                              fit: BoxFit.cover, // Adjust the fit for the image
                            )
                          : const Text('No image available'),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
