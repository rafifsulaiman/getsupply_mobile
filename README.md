# GetSupply
## Personal Data

- Nama : Rafif Sulaiman Dirvesa
- NPM : 2306222771
- Kelas : PBP C

# Table of Contents
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)

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
    - **FloatingActionButton**: tombol mengambang yang bisa ditekan, seperti tombol untuk menambahkan produk baru
    - **AlertDialog**: menampilkan dialog

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
      home: const MyHomePage(title: 'GetSupply'),
    );
  }
}
```

- untuk membuat tombol-tombol seperti lihat daftar produk, tambah produk, dan logout dengan warna yang berbeda-beda dan menampilkan teks menggunakan ```Snackbar```, begini kode nya
    - lihat daftar produk saya letakkan di main page seperti ini
    ```bash
    ...
            ElevatedButton.icon(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Kamu telah menekan tombol Lihat Daftar Produk")),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("Lihat Daftar Produk"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
    ...
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
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    ...
    ```

# TUGAS 8
[Back to Table of Contents](#table-of-contents)
## Jawaban
1. Kegunaan ```const```, keuntungannya, kapan sebaiknya digunakan, dan kapan sebaiknya tidak digunakan

  - ```const``` digunakan untuk membuat widget atau objek yang bersifat konstan (immutable). berarti niai dari objek atau widget akan selalu konsisten dan tidak akan berubah selama runtime.

  - **keuntungan** menggunakan ```const```:
    - **Optimalisasi performa**, karena dengan menggunakan ```const```, flutter tidap perlu membuat ulang widget ketika UI diperbarui, karena tidak pernah berubah
    - **Penggunaan memori yang lebih rendah**, karena widget atau objek yang menggunakan ```const``` diinisialisasi hanya sekali
    - **Debugging lebih mudah**, karena ```const``` tidak akan berubah, jadi bagian yang menggunakan ini tidak akan termodifikasi secara tidak sengaja selama aplikasi dijalankan
  
  - Kapan **sebaiknya** menggunakan ```const```?

    ```const``` sebaiknya digunakan pada widget atau objek yang tidak perlu diubah selama aplikasi berjalan, seperti teks tetap dan dekorasi yang tidak akan diubah.
  
  - Kapan **sebaiknya tidak** menggunakan ```const```?

    ```const``` sebaiknya tidak digunakan pada widget atau objek yang perlu/akan diubah selama aplikasi berjalan, karena ```const``` tidak dapat diperbarui tanpa melakukan rebuild.

2. Perbandingan ```column``` dan ```row``` pada flutter
  - **Column**

    ```Column``` digunakan untuk menyusun widget secara vertikal dari atas ke bawah, contoh implementasi nya:
    ```bash
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item 1"),
        Text("Item 2"),
        Text("Item 3"),
      ],
    )
    ```

  - **Row**

    ```Row``` digunakan untuk menyusun widget secara horizontal dari kiri ke kanan, contoh implementasi nya:
    ```bash
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.settings),
      ],
    )
    ```

3. **Elemen-elemen input** yang saya gunakan pada halaman form
  - ```TextFormField```: digunakan untuk menerima input dalam bentuk teks, seperti nama, deskripsi, URL, dan integer.
  - ```ElevatedButton```: tombol yang saya gunakan untuk menyimpan data yang diinput pada form.

4. Cara mengatur **tema (theme)** dalam aplikasi flutter
  saya mengatur tema pada aplikasi flutter saya menggunakan ```ThemeApp``` di dalam ```MaterialApp```, di sini saya menentukan warna dasar dan secondary color untuk tema saya. seperti ini implementasinya:

    ```bash
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
      ).copyWith(secondary: Colors.deepPurple),
    ),
    ```

5. **Navigasi** dalam aplikasi flutter
  untuk navigasi, saya menggunakan ```Navigator``` dengan ```MaterialPageRoute```. ```Navigator.push``` digunakan untuk menuju suatu halaman dan ```Navigator.pop``` digunakan untuk kembali ke halaman sebelumnya. contoh implementasi nya:
    ```bash
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductEntryFormPage(),
        ));
      },
      ...
      onPressed: () {
        Navigator.pop(context);
      ...
    ```