import 'package:flutter/material.dart';
import 'package:seeds/src/garden/garden_create_view.dart';
import 'package:seeds/src/garden/garden_item.dart';
import 'package:seeds/src/garden/garden_item_details_view.dart';
import 'package:seeds/src/plant/plant_item.dart';

class GardenItemListView extends StatelessWidget {
  const GardenItemListView({
    super.key,
    this.items = const [
      GardenItem(
          1,
          'alguma horta',
          {
            PlantItem(
                1, 1, 'alguma planta', 'planta legal demais', 'water-lily.png')
          },
          'water-lily.png')
    ],
  });

  static const routeName = '/gardens';

  final List<GardenItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hortas"),
      ),
      body: ListView.builder(
        restorationId: 'gardenItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.name),
              leading: CircleAvatar(
                foregroundImage: AssetImage('assets/images/${item.imageName}'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GardenItemDetailsView(garden: item)));
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Hortas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastrar',
          ),
        ],
        currentIndex: 0, // Initially set to 0 (current view is the garden list)
        onTap: (int index) {
          if (index == 1) {
            // If the "Registrar" button is tapped, push the register garden route
            Navigator.pushNamed(context, GardenCreateView.routeName);
          }
        },
      ),
    );
  }
}
