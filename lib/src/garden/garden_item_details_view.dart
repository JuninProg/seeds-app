import 'package:flutter/material.dart';
import 'package:seeds/src/garden/garden_item.dart';
import 'package:seeds/src/plant/plant_create_view.dart';

class GardenItemDetailsView extends StatelessWidget {
  const GardenItemDetailsView({
    super.key,
    required this.garden,
  });

  static const routeName = '/gardens/details';

  final GardenItem garden;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(garden.name),
      ),
      body: ListView.builder(
        itemCount: garden.plants.length,
        itemBuilder: (BuildContext context, int index) {
          final plant = garden.plants.elementAt(index);
          return ListTile(
            title: Text(plant.name),
            subtitle: Text(plant.description),
            leading: CircleAvatar(
              foregroundImage: AssetImage('assets/images/${plant.imageName}'),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Detalhes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastrar Planta',
          ),
        ],
        currentIndex: 0, // Estamos na tela de detalhes
        onTap: (int index) {
          if (index == 1) {
            // Navegar para a tela de registro de uma nova planta
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantCreateView(gardenItem: garden),
              ),
            );
          }
        },
      ),
    );
  }
}
