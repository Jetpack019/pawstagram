import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Pet {
  String name;
  File image;

  Pet({required this.name, required this.image});
}

class PetProfilePage extends StatefulWidget {
  const PetProfilePage({Key? key}) : super(key: key);

  @override
  _PetProfilePageState createState() => _PetProfilePageState();
}

class _PetProfilePageState extends State<PetProfilePage> {
  final _petNameController = TextEditingController();
  final _picker = ImagePicker();
  List<Pet> _pets = [];

  Future<void> _addPet() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pets.add(Pet(name: _petNameController.text, image: File(pickedFile.path)));
      });
    }
    _petNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pets'),
      ),
      body: ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(_pets[index].image),
            ),
            title: Text(_pets[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPet,
        tooltip: 'Add Pet',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            controller: _petNameController,
            decoration: InputDecoration(
              hintText: 'Enter pet name',
              suffixIcon: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () async {
                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _pets.add(Pet(name: _petNameController.text, image: File(pickedFile.path)));
                    });
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}