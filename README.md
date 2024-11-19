# GetSupply
## Personal Data

- Nama : Rafif Sulaiman Dirvesa
- NPM : 2306222771
- Kelas : PBP C

# Table of Contents
- [Tugas 7](#tugas-7)
- [Tugas 8](#tugas-8)
- [Tugas 9](#tugas-9)

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

# TUGAS 9
[Back to Table of Contents](#table-of-contents)
## Jawaban
**1. Alasan membuat model**
  - Model dalam Django atau Flutter menyediakan stuktur data yang akan diproses dan dikirimkan antar aplikasi dan server, dengan model kita dapat memetakan data JSON ke objek dengan tipe data yang tepat untuk memudahkan kita dalam memanipulasi data.
  - Model juga memungkinkan kita untuk melakukan validasi dan pengolahan data dengan mudah.
  - Kita dapat memetakan data JSON menjadi objek Python (di backend Django) atau objek Dart (pada flutter) dengan mudah menggunakan model.
  - Jika kita tidak membuat model dan hanya menangani JSON secara langsung tanpa pemetaan yang jelas, kesalahan terkait tipe data dapat terjadi, atau pengolahan data menjadi lebih rumit karena tidak ada struktur yang jelas. Tanpa model, kita harus melakukan parsing dan pengolahan JSON secara manual (rentan terhadap kesalahan).

**2. Fungsi Library ```http```**

Library ```http``` di Flutter digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server melalui HTTP. Beberapa fungsinya:
  - Berguna untuk mengirimkan permintaan/request HTTP seperti `GET`, `POST`, `PUT`, `DELETE`, dan lain-lain. Pada tugas kali ini, saya menggunakan `GET` untuk mengambil data dan `POST` untuk mengirim data ke server Django.
  - Seteleh mengirim permintaan HTTP, `http` memungkinkan kita untuk menangani responsenya, seperti memeriksa status kode (kode 200 untuk OK dan 500 untuk error) dan memproses data yang diterima dalam format seperti JSON.
  - Library ini juga memungkinkan kita untuk menangani error seperti timeouts atau kesalahan server dengan cara yang mudah.

**3. Fungsi dari `CookieRequest`**
  
  `CookieRequest` digunakan untuk menangani request HTTP dan mengelola cookies (seperti sesi atau token autentikasi) secara otomatis. Biasanya, `CookieRequest` menangani sesi login, mengingatkan server bahwa user yang sedang berinteraksi sudah terautentikasi, dan mengirimkan cookie bersama permintaan HTTP.
  
  Instance `CookieRequest` perlu dibagikan ke seluruh aplikasi Flutter agar semua komponen aplikasi dapat mengakses dan menggunakan cookie yang telah disimpan (misalnya token otentikasi) untuk melakukan autentikasi tanpa perlu login lagi.

  Dengan menggunakan `Provider` untuk membagikan instance `CookieRequest`, kita memastikan bahwa seluruh aplikasi mengakses request HTTP yang telah terautentikasi, menghindari keharusan memasukkan cookie secara manual di setiap komponen yang melakukan request HTTP.

**4. Mekanisme Pengiriman Data Mulai dari Input hingga Dapat Ditampilkan pada Flutter**

Langkah-langkah Pengiriman Data:

  - Pengguna memasukkan data (misalnya, nama produk, harga, atau deskripsi) melalui form input di aplikasi Flutter.
  - Data yang dimasukkan dikirim ke server Django menggunakan request HTTP. Biasanya menggunakan metode `POST` dengan format JSON, yang dikirimkan melalui `http.post()` atau metode serupa.
  - Server Django menerima data, memvalidasi, dan menyimpannya dalam database menggunakan model yang telah didefinisikan. Django kemudian mengirimkan respons, biasanya dalam format JSON, yang berisi status atau data yang disimpan.
  - Flutter menerima respons dari server, misalnya menggunakan `http.get()` atau `http.post()`, dan men-decode data JSON untuk digunakan dalam aplikasi.
  - Data yang diterima (seperti daftar produk) ditampilkan dalam UI Flutter, biasanya menggunakan widget seperti `ListView.builder` atau widget lain yang sesuai dengan format data.

**5. Mekanisme Autentikasi dari Login, Register, Hingga Logout**

Langkah-langkah Autentikasi:

  - Pengguna memasukkan informasi login (misalnya, email dan password) pada halaman login di aplikasi Flutter.
  - Data login dikirim ke server Django menggunakan request `POST` ke endpoint login (misalnya, `/login/`). Data ini biasanya dikirim dalam format JSON.
  - Django memeriksa data yang diterima, melakukan validasi password (biasanya menggunakan model `User` dan `authenticate()` dari Django). Jika data yang diterima valid, Django mengirimkan token autentikasi atau cookie yang menandakan sesi pengguna aktif.
  - Token atau cookie autentikasi disimpan di aplikasi Flutter, misalnya menggunakan package seperti `shared_preferences` untuk menyimpan token yang diperlukan untuk autentikasi di request HTTP selanjutnya.
  - Setelah autentikasi berhasil, menu aplikasi yang hanya dapat diakses oleh pengguna yang telah login ditampilkan. Aplikasi Flutter memeriksa apakah token autentikasi tersedia untuk memastikan pengguna sudah terautentikasi sebelum menampilkan menu.
  - Ketika pengguna memilih untuk logout, token atau cookie yang disimpan dihapus dan permintaan logout dikirim ke server Django. Biasanya menggunakan `POST` ke endpoint logout. Setelah logout berhasil, pengguna diarahkan kembali ke halaman login.

**6. Implementasi checklist secara step-by-step**

  - Pertama-tama, saya membuat `django-app` baru bernama `authentication` pada project Django saya. Lalu, saya menambahkan `authentication` pada `INSTALLED_APPS` di `settings.py` project saya, melakukan instalasi `django-cors-headers` (menambahkan `django-cors-headers` ke `requirements.txt` terlebih dahulu), menambahkan `corsheader` ke `INSTALLED_APPS` di `settings.py` project saya, menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` di `settings.py` project saya, menambahkan `10.0.2.2` pada `ALLOWED_HOSTS` di `settings.py` project saya, dan menambahkan variabel-variabel berikut pada `settings.py` project saya.

    ```bash
    ...
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ...
    ```

  - Setelah itu, saya melakukan modifikasi pada `views.py` di app `authentication` saya, berikut modifikasinya.

    ```bash
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt
    from django.contrib.auth.models import User
    import json
    from django.http import JsonResponse
    from django.contrib.auth import logout as auth_logout

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
            
    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
            
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```

  - lalu saya menambahkan potongan kode ini pada `views.py` app `main` saya

    ```bash
    ...
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':

            data = json.loads(request.body)
            new_product = Product.objects.create(
                user=request.user,
                name=data['name'],
                price=data['price'],
                description=data['description'],
                image=data['image'],
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```
  - lalu, saya menambahkan url berikut di `urls.py` pada app `main`

    ```bash
    path('create-flutter/', create_mood_flutter, name='create_mood_flutter'),
    ```
  - lalu, saya membuat file `urls.py` pada app `authentication`, berikut isi filenya

    ```bash
    from django.urls import path
    from authentication.views import login, register, logout

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
        path('register/', register, name='register'),
        path('logout/', logout, name='logout'),
    ]
    ```
  
  - lalu, saya menambahkan url untuk app `authentication` saya pada `urls.py` project saya

    ```bash
    ...
    urlpatterns = [
        path('admin/', admin.site.urls),
        path('', include('main.urls')),
        re_path(r'^media/(?P<path>.*)$',serve,{'document_root':settings.MEDIA_ROOT}),
        path('auth/', include('authentication.urls')),
    ]
    ...
    ```

  - lalu, saya melakukan instalasi package `pbp_django_auth` dengan menjalankan perintah `flutter pub add provider` dan `flutter pub add pbp_django_auth` pada terminal proyek flutter saya.

  - lalu, saya juga menambahkan package `http` dengan menjalankan perintah `flutter pub add http` pada terminal proyek flutter saya dan menambahkan kode berikut pada file `android/app/src/main/AndroidManifest.xml` untuk memperbolehkan akses internet pada aplikasi flutter saya

    ```bash
    ...
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```

  - lalu, saya melakukan modifikasi pada `main.dart` saya seperti ini

    ```bash
    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
      runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
          child: MaterialApp(
            title: 'GetSupply',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
              ).copyWith(secondary: Colors.deepPurple),
            ),
            home: const LoginPage(),
          ),
        );
      }
    }
    ```

  - lalu, saya membuat file baru bernama `login.dart` pada `lib/screens` yang berisi seperti ini

    ```bash
    import 'package:getsupply_mobile/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/register.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
      runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
      const LoginApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Login',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
            ).copyWith(secondary: Colors.deepPurple[400]),
          ),
          home: const LoginPage(),
        );
      }
    }

    class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      State<LoginPage> createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          String username = _usernameController.text;
                          String password = _passwordController.text;

                          // Cek kredensial
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          // Untuk menyambungkan Android emulator dengan Django pada localhost,
                          // gunakan URL http://10.0.2.2/
                          final response = await request
                              .login("http://127.0.0.1:8000/auth/login/", {
                            'username': username,
                            'password': password,
                          });

                          if (request.loggedIn) {
                            String message = response['message'];
                            String uname = response['username'];
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("$message Selamat datang, $uname.")),
                                );
                            }
                          } else {
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Login Gagal'),
                                  content: Text(response['message']),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 36.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Register',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    ```

  - lalu, saya membuat file baru bernama `register.dart` pada `lib/screens` yang berisi seperti ini

    ```bash
    import 'dart:convert';
    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class RegisterPage extends StatefulWidget {
      const RegisterPage({super.key});

      @override
      State<RegisterPage> createState() => _RegisterPageState();
    }

    class _RegisterPageState extends State<RegisterPage> {
      final _usernameController = TextEditingController();
      final _passwordController = TextEditingController();
      final _confirmPasswordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          String username = _usernameController.text;
                          String password1 = _passwordController.text;
                          String password2 = _confirmPasswordController.text;

                          final response = await request.postJson(
                              "http://127.0.0.1:8000/auth/register/",
                              jsonEncode({
                                "username": username,
                                "password1": password1,
                                "password2": password2,
                              }));
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Successfully registered!'),
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to register!'),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    ```

  - lalu, saya membuat file baru bernama `list_supplyentry.dart` pada `lib/screens` yang berisi seperti ini

    ```bash
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
    ```

  - lalu, saya membuat file baru bernama `supply_entry.dart` pada `lib/models` yang berisi seperti ini

    ```bash
    import 'dart:convert';

    List<SupplyEntry> supplyEntryFromJson(String str) => List<SupplyEntry>.from(json.decode(str).map((x) => SupplyEntry.fromJson(x)));

    String supplyEntryToJson(List<SupplyEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    class SupplyEntry {
        String model;
        String pk;
        Fields fields;

        SupplyEntry({
            required this.model,
            required this.pk,
            required this.fields,
        });

        factory SupplyEntry.fromJson(Map<String, dynamic> json) => SupplyEntry(
            model: json["model"],
            pk: json["pk"],
            fields: Fields.fromJson(json["fields"]),
        );

        Map<String, dynamic> toJson() => {
            "model": model,
            "pk": pk,
            "fields": fields.toJson(),
        };
    }

    class Fields {
        String name;
        int price;
        String description;
        String image;

        Fields({
            required this.name,
            required this.price,
            required this.description,
            required this.image,
        });

        factory Fields.fromJson(Map<String, dynamic> json) => Fields(
            name: json["name"],
            price: json["price"],
            description: json["description"],
            image: json["image"],
        );

        Map<String, dynamic> toJson() => {
            "name": name,
            "price": price,
            "description": description,
            "image": image,
        };
    }
    ```

  - lalu, saya melakukan modifikasi pada `productentry_form.dart` saya seperti ini

    ```bash
    import 'dart:convert';

    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/menu.dart';
    import 'package:getsupply_mobile/widgets/left_drawer.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class ProductEntryFormPage extends StatefulWidget {
      const ProductEntryFormPage({super.key});

      @override
      State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
    }

    class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _price = 0;
      String _description = "";
      String _imageURL = "";

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Produk',
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Nama Produk",
                        labelText: "Nama Produk",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Nama produk tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _price = int.tryParse(value!) ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Harga produk tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Harga produk harus berupa angka!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Description",
                        labelText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Image URL",
                        labelText: "Image URL",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _imageURL = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Image URL tidak boleh kosong!";
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                        ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price.toString(),
                              "description": _description,
                              "image": _imageURL
                            }),
                          );
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Product baru berhasil disimpan!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("Terdapat kesalahan, silakan coba lagi."),
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      }
    }
    ```

  - lalu, saya melakukan modifikasi pada `left_drawer.dart` saya seperti ini

    ```bash
    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/list_supplyentry.dart';
    import 'package:getsupply_mobile/screens/menu.dart';
    import 'package:getsupply_mobile/screens/productentry_form.dart';

    class LeftDrawer extends StatelessWidget {
      const LeftDrawer({super.key});

      @override
      Widget build(BuildContext context) {
        return Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                    decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const Column(
          children: [
            Text(
              'GetSupply',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
              ),
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Halaman Utama'),
        // Bagian redirection ke MyHomePage
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.mood),
        title: const Text('Add Product'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.add_reaction_rounded),
        title: const Text('Product List'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SupplyEntryPage(),
              ));
        },
      ),
            ],
          ),
        );
      }
    }
    ```

  - lalu, saya melakukan modifikasi pada `product_card.dart` saya seperti ini

    ```bash
    import 'package:flutter/material.dart';
    import 'package:getsupply_mobile/screens/productentry_form.dart';
    import 'package:getsupply_mobile/screens/list_supplyentry.dart';
    import 'package:getsupply_mobile/screens/login.dart';
    import 'package:provider/provider.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';

    class ItemHomepage {
        final String name;
        final IconData icon;
        final Color color;

        ItemHomepage(this.name, this.icon, this.color);
    }

    class ItemCard extends StatelessWidget {
      // Menampilkan kartu dengan ikon dan nama.

      final ItemHomepage item; 
      
      const ItemCard(this.item, {super.key}); 

      @override
      Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
          // Menentukan warna latar belakang dari tema aplikasi.
          color: item.color,
          // Membuat sudut kartu melengkung.
          borderRadius: BorderRadius.circular(12),
          
          child: InkWell(
            // Aksi ketika kartu ditekan.
            onTap: () async {
              // Menampilkan pesan SnackBar saat kartu ditekan.
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                );
              if (item.name == 'Add Product') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
                );
              }
              else if (item.name == "Lihat Daftar Produk") {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const SupplyEntryPage()
                    ),
                );
              }
              else if (item.name == "Logout") {
                  final response = await request.logout(
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      "http://127.0.0.1:8000/auth/logout/");
                  String message = response["message"];
                  if (context.mounted) {
                      if (response['status']) {
                          String uname = response["username"];
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("$message Sampai jumpa, $uname."),
                          ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                          );
                      } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(message),
                              ),
                          );
                      }
                  }
              }
            },
            // Container untuk menyimpan Icon dan Text
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  // Menyusun ikon dan teks di tengah kartu.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    ```