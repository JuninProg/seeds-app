import 'package:flutter/material.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
import 'package:seeds/src/plant/plant_item.dart';

class PlantItemDetailsView extends StatelessWidget {
  const PlantItemDetailsView({
    super.key,
    required this.plant,
  });

  static const routeName = '/plants/details';

  final PlantItem plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              foregroundImage: AssetImage('assets/images/${plant.imageName}'),
            ),
            const SizedBox(height: 20),
            Text(
              plant.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              plant.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: -1),
    );
  }
}
