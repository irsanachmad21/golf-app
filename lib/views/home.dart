// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:golf_app/views/entry_form.dart';
import 'package:golf_app/models/golf.dart';
import 'package:golf_app/helpers/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Golf> golfList = [];
  List<Golf> filteredGolfList = [];
  String searchQuery = '';
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    updateListView();

    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        setState(() {
          searchQuery = '';
          filteredGolfList =
              golfList;
          count = filteredGolfList.length;
        });
      }
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (searchFocusNode.hasFocus) {
          searchFocusNode.unfocus();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  labelText: 'Search by Name',
                  labelStyle: TextStyle(fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filteredGolfList = golfList
                        .where((golf) => golf.nama
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();
                    count = filteredGolfList.length;
                  });
                },
              ),
            ),
            Expanded(
              child: createListView(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF00AA13),
          tooltip: 'Add Booking',
          onPressed: () async {
            var golf = await navigateToEntryForm(
              context,
              Golf(
                nama: '',
                tanggal: '',
                jam: '',
                noTelp: '',
                email: '',
                alamat: '',
                drivingRange: '',
                ballsValue: '',
                tipeLapangan: '',
                metodePembayaran: '',
              ),
            );
            if (golf != null) {
              addBook(golf);
            }
          },
        ),
      ),
    );
  }

  Future<Golf?> navigateToEntryForm(BuildContext context, Golf? golf) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(golf);
    }));
    return result;
  }

  void addBook(Golf object) async {
    int result = await dbHelper.insertGolf(object);
    if (result != 0) {
      updateListView();
    }
  }

  void editBook(Golf object) async {
    int result = await dbHelper.updateGolf(object);
    if (result != 0) {
      updateListView();
    }
  }

  void deleteBook(int id) async {
    int result = await dbHelper.deleteGolf(id);
    if (result != 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Golf>> golfListFuture = dbHelper.getGolfList();
      golfListFuture.then((golfList) {
        setState(() {
          this.golfList = golfList;
          this.filteredGolfList =
              golfList;
          this.count = golfList.length;
        });
      });
    });
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF00AA13),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text(
              '${this.filteredGolfList[index].nama} - ${this.filteredGolfList[index].drivingRange}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                '${this.filteredGolfList[index].tanggal} - ${this.filteredGolfList[index].jam}'),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Color(0xFFEE2737)),
              onTap: () {
                confirmDelete(filteredGolfList[index].id!);
              },
            ),
            onTap: () async {
              var golf = await navigateToEntryForm(
                  context, this.filteredGolfList[index]);
              if (golf != null) {
                editBook(golf);
              }
            },
          ),
        );
      },
    );
  }

  void confirmDelete(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Hapus"),
          content: Text("Apakah Anda yakin ingin menghapus booking ini?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Hapus"),
              onPressed: () {
                deleteBook(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
