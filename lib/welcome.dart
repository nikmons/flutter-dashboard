import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return Scaffold(
        body: Container(
          color: Colors.grey[100],
          child: Center(
            child: SizedBox(
              width: 800,
              child:StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) => new Container(
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$index'),
                      ),
                    )),
                staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
              ),
              ),
            ),
          ),
        );

    return Scaffold(
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
      );
  }
}