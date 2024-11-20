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
    final response = await request.get('http://127.0.0.1:8000/json/');

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
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.5, // Aspect ratio to make them horizontal
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Reduced padding for smaller box
                    child: Row( // Ensuring horizontal layout with Row
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image on the left
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: snapshot.data![index].fields.image.isNotEmpty
                              ? Image.network(
                                  snapshot.data![index].fields.image,
                                  width: 150,  // Increased image size
                                  height: 150, // Increased image size
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.image, size: 150),
                        ),
                        const SizedBox(width: 16),
                        // Product content on the right
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].fields.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                snapshot.data![index].fields.description,
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Rp ${snapshot.data![index].fields.price}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
