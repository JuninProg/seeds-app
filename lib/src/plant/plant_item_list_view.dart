import 'package:flutter/material.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
import 'package:seeds/src/plant/plant_item.dart';
import 'package:seeds/src/plant/plant_item_details_view.dart';

class PlantItemListView extends StatelessWidget {
  const PlantItemListView({
    super.key,
    this.items = const [
      PlantItem(1, 1, 'alguma planta', 'planta legal demais', 'water-lily.png')
    ],
  });

  static const routeName = '/plants';

  final List<PlantItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plantas"),
      ),
      body: ListView.builder(
        restorationId: 'plantItemListView',
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
                            PlantItemDetailsView(plant: item)));
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
