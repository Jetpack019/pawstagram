import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: 10,
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 200, // set the height of the container
                width: double
                    .infinity, // set the width to fill the available space
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/pet${index + 1}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
