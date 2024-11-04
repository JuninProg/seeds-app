import 'package:flutter/material.dart';
import 'package:seeds/src/components/charts/pie_chart_2.dart';
import 'package:seeds/src/components/charts/scatter_chart.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
import 'package:seeds/src/plant/plant_item.dart';

class PlantItemListView extends StatelessWidget {
  const PlantItemListView({
    super.key,
    this.items = const [
      PlantItem(1, 1, 'Tomate', 'Planta de tomate', 'tomato.png', 'Vegetal',
          'Verão', 30),
      PlantItem(
          2, 1, 'Rosa', 'Planta de rosa', 'rose.png', 'Flor', 'Primavera', 15),
      PlantItem(
          3, 1, 'Maçã', 'Planta de maçã', 'apple.png', 'Fruta', 'Outono', 60),
    ],
  });

  static const routeName = '/plants';

  final List<PlantItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estatísticas das Plantas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PieChartSample2(items: items),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ScatterChartSample(items: items),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
