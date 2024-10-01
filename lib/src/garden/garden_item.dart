import 'package:seeds/src/plant/plant_item.dart';

class GardenItem {
  const GardenItem(this.id, this.name, this.plants, this.imageName);

  final int id;
  final String name;
  final Set<PlantItem> plants;
  final String imageName;
}
