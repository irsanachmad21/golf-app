import 'package:flutter/material.dart';

class Golf {
  int? id; // ID bisa null jika baru ditambahkan
  String nama;
  String tanggal;
  String jam;
  String noTelp;
  String email;
  String alamat;
  String drivingRange;
  String ballsValue;
  String tipeLapangan;
  String metodePembayaran;

  // Konstruktor
  Golf({
    required this.nama,
    required this.tanggal,
    required this.jam,
    required this.noTelp,
    required this.email,
    required this.alamat,
    required this.drivingRange,
    required this.ballsValue,
    required this.tipeLapangan,
    required this.metodePembayaran,
  });

  // Konstruktor: Konversi dari Map ke Golf
  Golf.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nama = map['nama'] ?? '', // Memberikan nilai default jika null
        tanggal = map['tanggal'] ?? '',
        jam = map['jam'] ?? '',
        noTelp = map['no_telp'] ?? '',
        email = map['email'] ?? '',
        alamat = map['alamat'] ?? '',
        drivingRange = map['driving_range'] ?? '',
        ballsValue = map['balls_value'] ?? '',
        tipeLapangan = map['tipe_lapangan'] ?? '',
        metodePembayaran = map['metode_pembayaran'] ?? '';

  // Metode untuk mengubah objek Golf ke Map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nama': nama,
      'tanggal': tanggal,
      'jam': jam,
      'no_telp': noTelp,
      'email': email,
      'alamat': alamat,
      'driving_range': drivingRange,
      'balls_value': ballsValue,
      'tipe_lapangan': tipeLapangan,
      'metode_pembayaran': metodePembayaran,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
