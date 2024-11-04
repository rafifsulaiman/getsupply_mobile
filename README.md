# GetSupply
## Personal Data

- Nama : Rafif Sulaiman Dirvesa
- NPM : 2306222771
- Kelas : PBP C

# Table of Contents
- [Tugas 7](#tugas-7)

# TUGAS 7
[Back to Table of Contents](#table-of-contents)
## Jawaban
1. Perbedaan **Stateless Widget** dan **Stateful Widget**
    - **Stateless Widget**
        - bersifat statis, tidak berubah setelah diinisialisasi
        - hanya di-render sekali dan tidak akan berubah selama aplikasi berjalan
        - contohnya jika ingin menampilkan teks tetap, sebaiknya gunakan ```StatelessWidget```
    - **Stateful Widget**
        - memiliki state atau kondisi yang bisa berubah kapan saja. jika diubah, widget akan di-render ulang untuk menyesuaikan tampilan mengikuti kondisi terbaru
        - biasa digunakan ketika UI perlu berubah ketika digunakan, semacam feedback dari interaksi pengguna atau perubahan data
        - contohnya seperti formulir yang memperbarui hasil saat dilakukan input

    Perbedaan utamanya adalah ```StatelesWidget``` tidak berubah setelah dibuat, sedangkan ```StatefulWidget``` bisa berubah setelah dibuat.

2. **Widget** yang digunakan dan fungsi nya
    - **MaterialApp**: membuat aplikasi flutter dengan desain material dan menyediakan fitur seperti tema, judul, dan navigasi
    - **Scaffold**: memberikan struktur dasar visual aplikasi, termasuk ```appBar```, ```body```, dan ```floatingActionButton```
    - **AppBar**: membuat bar di bagian atas layar dengan judul dan tombol logout
    - **Container**: membuat kotak yang bisa diatur dengan padding, margin, warna, ukuran
    - **Column**: widget tata letak yang menempatkan elemen-elemen secara vertikal
    - **Center**: menampilkan elemen di tengah layar
    - **Text**: menampilkan teks di layar
    - **ElevatedButton**: membuat tombol yang bisa ditekan, seperti tombol lihat daftar produk
    - **IconButton**: tombol dengan ikon, seperti tombol logout
    - **ListView**: membuat daftar untuk menampilkan produk
    - **FloatingActionButton**: tombol mengambang yang bisa ditekan, seperti tombol untuk menambahkan produk baru
    - **AlertDialog**: menampilkan dialog
    - **TextFormField**: field untuk input teks

3. Fungsi **```setState()```**
    - fungsi pada ```StatefulWidget``` yang berguna untuk memberi tahu flutter bahwa ada perubahan pada state. ketika fungsi ini dipanggil. flutter akan memperbarui UI sesuai dengan perubahan state tersebut
    - dari proyek flutter saya, variabel ```foodItems``` diperbarui menggunakan fungsi ini. setiap kali ada produk yang ditambahkan, fungsi ini akan dipanggil untuk memperbarui daftar di layar

4. Perbedaan antara **```const```** dan **```final```**
    - ```const``` digunakan untuk membuat variabel dengan nilai tetap yang sudah diketahui saat aplikasi dijalankan. ```const``` membuat variabel tidak dapat diubah (immutable)
    - ```final``` mirip seperti ```const```, yaitu membuat variabel yang tidak dapat diubah setelah dideklarasikan, tetapi nilainya bisa ditentukan saat aplikasi berjalan

    Perbedaan utamanya adalah ```const``` nilai nya harus ditentukan dulu sebelum aplikasi dijalankan, sedangkan ```final``` nilainya bisa ditentukan saat aplikasi berjalan

5. Cara implementasi sesuai checklist
- pertama-tama, saya melakukan modifikasi pada widget di kelas ```MyApp``` seperti ini

    ```bash
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'GetSupply',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ),
        home: const LoginPage(),
        );
    }
    }
    ```

- membuat class ```LoginPage``` dan ```LoginForm``` untuk login pengguna dengan input berupa username dan password

- membuat class ```RegisterForm``` dan ```RegisterPage``` untuk membuat akun pengguna dengan input username dan password, data input pengguna ini disimpan pada ```Map``` berisi string username dan string password

- membuat class ```FoodItem``` dengan parameter name, description, price, dan imageurl

- lalu membuat tampilan ```MyHomePage```, fungsi ```_addFoodItem```, fungsi ```_scrollToProducts```, dan fungsi ```_showAddFoodDialog``` seperti ini:
    ```bash
    class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});
    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
    }

    class _MyHomePageState extends State<MyHomePage> {
    List<FoodItem> foodItems = [];
    final ScrollController _scrollController = ScrollController();

    void _addFoodItem(String name, String description, double price, String imageUrl) {
        setState(() {
        foodItems.add(FoodItem(name: name, description: description, price: price, imageUrl: imageUrl));
        });
    }

    void _scrollToProducts() {
        _scrollController.animateTo(
        200.0, // Sesuaikan posisi ini untuk bagian "Products"
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        );
    }

    void _showAddFoodDialog(BuildContext context) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController descriptionController = TextEditingController();
        final TextEditingController priceController = TextEditingController();
        final TextEditingController imageUrlController = TextEditingController();

        showDialog(
        context: context,
        builder: (context) {
            return AlertDialog(
            title: Center(
                child: Text(
                "Add New Product",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                ),
                ),
            ),
            content: SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    _buildTextField(controller: nameController, labelText: "Name", hintText: "Enter product name"),
                    const SizedBox(height: 10),
                    _buildTextField(controller: priceController, labelText: "Price", hintText: "Enter price", keyboardType: TextInputType.number),
                    const SizedBox(height: 10),
                    _buildTextField(controller: descriptionController, labelText: "Description", hintText: "Enter description"),
                    const SizedBox(height: 10),
                    _buildTextField(controller: imageUrlController, labelText: "Image URL", hintText: "Enter image URL"),
                ],
                ),
            ),
            actions: [
                ElevatedButton(
                onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        priceController.text.isNotEmpty &&
                        imageUrlController.text.isNotEmpty) {
                    _addFoodItem(
                        nameController.text,
                        descriptionController.text,
                        double.parse(priceController.text),
                        imageUrlController.text,
                    );
                    Navigator.of(context).pop();
                    }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[600],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    ),
                ),
                child: const Text(
                    "Add",
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                ),
                TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
                ),
            ],
            );
        },
        );
    }

    Widget _buildTextField({
        required TextEditingController controller,
        required String labelText,
        required String hintText,
        TextInputType keyboardType = TextInputType.text,
    }) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(labelText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800])),
            const SizedBox(height: 5),
            TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            ),
        ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.purple,
            actions: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                tooltip: 'Log Out',
                onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Kamu telah menekan tombol Logout")),
                    );
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                },
                ),
            ),
            ],
        ),
        body: Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Center(
                child: Text(
                    'Welcome to GetSupply!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                ),
                const SizedBox(height: 20),

                ElevatedButton.icon(
                onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Kamu telah menekan tombol Logout")),
                    );
                    _scrollToProducts();
                },
                icon: const Icon(Icons.list),
                label: const Text("Lihat Daftar Produk"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                ),
                const SizedBox(height: 20),
                const Text(
                "Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                const SizedBox(height: 10),
                Expanded(
                child: foodItems.isEmpty
                    ? Center(child: Text("Data product is empty.", style: TextStyle(fontSize: 16, color: Colors.grey)))
                    : ListView.builder(
                        controller: _scrollController, // Tambahkan controller di sini
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                            final food = foodItems[index];
                            return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                                leading: Image.network(food.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                                title: Text(food.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(food.description),
                                    const SizedBox(height: 4),
                                    Text("Rp. ${food.price.toStringAsFixed(2)}", style: TextStyle(color: Colors.grey[600])),
                                ],
                                ),
                            ),
                            );
                        },
                        ),
                ),
            ],
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Kamu telah menekan tombol Tambah Produk")),
            );
            _showAddFoodDialog(context);
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.add, color: Colors.white),
        ),
    );
    ```

- untuk membuat tombol-tombol seperti lihat daftar produk, tambah produk, dan logout dengan warna yang berbeda-beda dan menampilkan teks menggunakan ```Snackbar```, begini kode nya
    - lihat daftar produk saya letakkan di main page seperti ini
        ```bash
        ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol Logout")),
                );
                _scrollToProducts();
              },
              icon: const Icon(Icons.list),
              label: const Text("Lihat Daftar Produk"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
        ```
    - tambah produk saya letakkan di ```appBar``` seperti ini
        ```bash
        ...
        appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: Colors.purple,
            actions: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        tooltip: 'Log Out',
                        onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Kamu telah menekan tombol Logout")),
                            );
                            Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                        },
                    ),
                ),
            ],
        ),
        ...
        ```
    
    - tombol tambah produk saya buat dengan ```floatingActionButton``` di main page seperti ini
        ```bash
        ...
        floatingActionButton: FloatingActionButton(
            onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Kamu telah menekan tombol Tambah Produk")),
            );
            _showAddFoodDialog(context);
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.add, color: Colors.white),
        ),
        ...
        ```

