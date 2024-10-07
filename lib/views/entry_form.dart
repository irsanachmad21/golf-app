// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:golf_app/models/golf.dart';

class EntryForm extends StatefulWidget {
  final Golf? golf;
  EntryForm(this.golf);

  @override
  EntryFormState createState() => EntryFormState(this.golf);
}

class EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  Golf? golf;

  EntryFormState(this.golf);

  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jamController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  DateTime? bookingDate;
  String? drivingRangeValue;
  String? ballsValue;
  String? tipeLapanganValue;
  String? metodePembayaranValue;

  @override
  void initState() {
    super.initState();
    if (widget.golf != null) {
      namaController.text = widget.golf!.nama;
      tanggalController.text = widget.golf!.tanggal;
      jamController.text = widget.golf!.jam;
      noTelpController.text = widget.golf!.noTelp;
      emailController.text = widget.golf!.email;
      alamatController.text = widget.golf!.alamat;
      drivingRangeValue = widget.golf!.drivingRange;
      ballsValue = widget.golf!.ballsValue;
      tipeLapanganValue = widget.golf!.tipeLapangan;
      metodePembayaranValue = widget.golf!.metodePembayaran;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00AA13),
        title: Text('Manage Book',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // Nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),

              // Tanggal
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        bookingDate = selectedDate;
                        tanggalController.text =
                            "${bookingDate!.day.toString().padLeft(2, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.year}";
                      });
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tanggalController.text.isEmpty
                              ? 'Pilih Tanggal'
                              : tanggalController.text,
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ),

              // Jam
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (selectedTime != null) {
                      String formattedTime =
                          "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}";
                      setState(() {
                        jamController.text =
                            formattedTime;
                      });
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          jamController.text.isEmpty
                              ? 'Pilih Jam'
                              : jamController.text,
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
              ),

              // No Telepon
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextFormField(
                  controller: noTelpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'No. Telepon',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Icon(Icons.phone)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'No. Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),

              // Email
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Icon(Icons.email)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@')) {
                      return 'Masukkan email yang valid';
                    }
                    return null;
                  },
                ),
              ),

              // Alamat
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextFormField(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Alamat',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Icon(Icons.location_on)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),

              // Driving Range
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Driving Range Player',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio<String>(
                          value: 'Guest',
                          groupValue: drivingRangeValue,
                          onChanged: (String? value) {
                            setState(() {
                              drivingRangeValue = value!;
                              ballsValue =
                                  null;
                            });
                          },
                        ),
                        Text('Guest'),
                        Radio<String>(
                          value: 'Member',
                          groupValue: drivingRangeValue,
                          onChanged: (String? value) {
                            setState(() {
                              drivingRangeValue = value!;
                              ballsValue =
                                  null;
                            });
                          },
                        ),
                        Text('Member'),
                      ],
                    ),
                    // Tampilkan opsi tambahan berdasarkan pilihan
                    if (drivingRangeValue == 'Guest') ...[
                      Text('Pilih Bola:'),
                      Column(
                        // Menggunakan Column untuk menempatkan pilihan bola di bawah
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Radio<String>(
                                value: '50 Balls',
                                groupValue: ballsValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    ballsValue = value!;
                                  });
                                },
                              ),
                              Text('50 Bola = Rp 90.000'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio<String>(
                                value: '100 Balls',
                                groupValue: ballsValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    ballsValue = value!;
                                  });
                                },
                              ),
                              Text('100 Bola = Rp 135.000'),
                            ],
                          ),
                        ],
                      ),
                    ] else if (drivingRangeValue == 'Member') ...[
                      Text('Pilih Bola:'),
                      Column(
                        // Menggunakan Column untuk menempatkan pilihan bola di bawah
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Radio<String>(
                                value: '50 Balls',
                                groupValue: ballsValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    ballsValue = value!;
                                  });
                                },
                              ),
                              Text('50 Bola = Rp 50.000'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio<String>(
                                value: '100 Balls',
                                groupValue: ballsValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    ballsValue = value!;
                                  });
                                },
                              ),
                              Text('100 Bola = Rp 85.000'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              // Tipe Lapangan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tipe Lapangan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio<String>(
                          value: 'Indoor',
                          groupValue: tipeLapanganValue,
                          onChanged: (String? value) {
                            setState(() {
                              tipeLapanganValue = value!;
                            });
                          },
                        ),
                        Text('Indoor'),
                        Radio<String>(
                          value: 'Outdoor',
                          groupValue: tipeLapanganValue,
                          onChanged: (String? value) {
                            setState(() {
                              tipeLapanganValue = value!;
                            });
                          },
                        ),
                        Text('Outdoor'),
                      ],
                    ),
                  ],
                ),
              ),

              // Metode Pembayaran
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Metode Pembayaran',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio<String>(
                          value: 'Tunai',
                          groupValue: metodePembayaranValue,
                          onChanged: (String? value) {
                            setState(() {
                              metodePembayaranValue = value!;
                            });
                          },
                        ),
                        Text('Tunai'),
                        Radio<String>(
                          value: 'Transfer',
                          groupValue: metodePembayaranValue,
                          onChanged: (String? value) {
                            setState(() {
                              metodePembayaranValue = value!;
                            });
                          },
                        ),
                        Text('Transfer'),
                      ],
                    ),
                  ],
                ),
              ),

              // Tombol Simpan
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00AA13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.golf == null) {
                              // Tambahkan golf baru
                              Navigator.pop(
                                context,
                                Golf(
                                  nama: namaController.text,
                                  tanggal: tanggalController.text,
                                  jam: jamController.text,
                                  noTelp: noTelpController.text,
                                  email: emailController.text,
                                  alamat: alamatController.text,
                                  drivingRange: drivingRangeValue!,
                                  ballsValue: ballsValue!,
                                  tipeLapangan: tipeLapanganValue!,
                                  metodePembayaran: metodePembayaranValue!,
                                ),
                              );
                            } else {
                              // Ubah golf yang ada
                              widget.golf!.nama = namaController.text;
                              widget.golf!.tanggal = tanggalController.text;
                              widget.golf!.jam = jamController.text;
                              widget.golf!.noTelp = noTelpController.text;
                              widget.golf!.email = emailController.text;
                              widget.golf!.alamat = alamatController.text;
                              widget.golf!.drivingRange = drivingRangeValue!;
                              widget.golf!.ballsValue = ballsValue!;
                              widget.golf!.tipeLapangan = tipeLapanganValue!;
                              widget.golf!.metodePembayaran =
                                  metodePembayaranValue!;
                              Navigator.pop(context, widget.golf);
                            }
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00AED6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
