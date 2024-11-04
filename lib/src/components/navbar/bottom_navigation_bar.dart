import 'package:flutter/material.dart';
import 'package:seeds/src/garden/garden_item_list_view.dart';
import 'package:seeds/src/plant/plant_item_list_view.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildNavItem(context, Icons.grass, 'Hortas', 0),
          const SizedBox(width: 40), // Espaço para o botão central
          _buildNavItem(context, Icons.emoji_nature, 'Plantas', 1),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, GardenItemListView.routeName);
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, PlantItemListView.routeName);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: currentIndex == index ? Colors.blue : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function() onPressed;

  const CustomFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Adicionar',
      child: const Icon(Icons.add),
    );
  }
}
