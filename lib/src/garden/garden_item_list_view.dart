import 'package:flutter/material.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
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
            PlantItem(1, 1, 'alguma planta', 'planta legal demais',
                'water-lily.png', 'Fruta', 'Verão', 30)
          },
          'water-lily.png',
          'alguma localização',
          1000.10),
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
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, GardenCreateView.routeName);
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
