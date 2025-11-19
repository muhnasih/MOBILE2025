Soal 13
Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?
Praktikum ini mengajarkan pakai BLoC biar UI sama logika dipisah rapi.
Angka acaknya dibuat di file random_bloc.dart (bukan di screen).
Screen cuma ngirim perintah “buat angka baru” dan “dengerin” hasilnya lewat Stream.
Jadi letak BLoC-nya:

Semua logika angka acak → di random_bloc.dart
UI cuma kirim tombol & tampilkan hasil → di random_screen.dart + StreamBuilder.
Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
Lalu lakukan commit dengan pesan "W12: Jawaban Soal 13".
![alt text](<img/Screenshot 2025-11-19 074412.png>)