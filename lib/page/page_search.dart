import 'package:flutter/material.dart';
import 'package:petapp/model/pet_data.dart';

class SearchPet extends StatefulWidget {
  const SearchPet({Key? key}) : super(key: key);

  @override
  State<SearchPet> createState() => _SearchPetState();
}

class _SearchPetState extends State<SearchPet> {
  List<Pet> _items = [
    Pet(breed: 'Golden Retriever', imageUrl: 'assets/pet1.jpg'),
    Pet(breed: 'Labrador Retriever', imageUrl: 'assets/pet2.jpg'),
    Pet(breed: 'Poodle', imageUrl: 'assets/pet3.jpg'),
    Pet(breed: 'Bulldog', imageUrl: 'assets/pet4.jpg'),
    Pet(breed: 'Beagle', imageUrl: 'assets/pet5.jpg'),
    Pet(breed: 'German Shepherd', imageUrl: 'assets/pet6.jpg'),
    Pet(breed: 'Boxer', imageUrl: 'assets/pet7.jpg'),
    Pet(breed: 'Dalmatian', imageUrl: 'assets/pet8.jpg'),
    Pet(breed: 'Chihuahua', imageUrl: 'assets/pet9.jpg'),
    Pet(breed: 'Siberian Husky', imageUrl: 'assets/pet10.jpg'),
  ];
  List<Pet> _filteredItems = [];

  @override
  void initState() {
    _filteredItems = _items;
    super.initState();
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _items
          .where(
              (item) => item.breed.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_filteredItems[index].imageUrl),
                  ),
                  title: Text(_filteredItems[index].breed),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
