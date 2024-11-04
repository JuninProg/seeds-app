import 'package:seeds/src/plant/plant_item.dart';

class GardenItem {
  const GardenItem(
    this.id,
    this.name,
    this.plants,
    this.imageName,
    this.location,
    this.size,
  );

  final int id;
  final String name;
  final Set<PlantItem> plants;
  final String imageName;
  final String location; // Localização da horta
  final double size; // Tamanho da horta em metros quadrados
}
