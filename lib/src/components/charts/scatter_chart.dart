import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:seeds/src/plant/plant_item.dart';

class ScatterChartSample extends StatelessWidget {
  const ScatterChartSample({super.key, required this.items});

  final List<PlantItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Plantas por Estação x Dias para Germinar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ScatterChart(
            ScatterChartData(
              scatterSpots: _createScatterSpots(),
              minX: 0,
              maxX: 4,
              minY: 0,
              maxY: _getMaxDaysToSprout().toDouble(),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                ),
              ),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      );
                    },
                    reservedSize: 30,
                  )),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value) {
                        case 1:
                          return const Text(
                            'Primavera',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        case 2:
                          return const Text(
                            'Verão',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        case 3:
                          return const Text(
                            'Outono',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        case 4:
                          return const Text(
                            'Inverno',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                    reservedSize: 30,
                  ))),
            ),
          ),
        ),
      ],
    );
  }

  List<ScatterSpot> _createScatterSpots() {
    final Map<String, List<PlantItem>> plantsBySeason = {
      'Primavera': [],
      'Verão': [],
      'Outono': [],
      'Inverno': [],
    };

    for (var plant in items) {
      plantsBySeason[plant.season]?.add(plant);
    }

    final List<ScatterSpot> spots = [];
    plantsBySeason.forEach((season, plants) {
      final x = _getSeasonXValue(season);
      for (var plant in plants) {
        spots.add(
          ScatterSpot(x.toDouble(), plant.daysToSprout.toDouble(),
              // radius: plants.length.toDouble(),
              // color: _getColorForSeason(season),
              dotPainter: FlDotCirclePainter(
                color: _getColorForSeason(season),
                radius: plants.length.toDouble(),
              )),
        );
      }
    });

    return spots;
  }

  int _getSeasonXValue(String season) {
    switch (season) {
      case 'Primavera':
        return 1;
      case 'Verão':
        return 2;
      case 'Outono':
        return 3;
      case 'Inverno':
        return 4;
      default:
        return 0;
    }
  }

  int _getMaxDaysToSprout() {
    return items
        .map((plant) => plant.daysToSprout)
        .reduce((a, b) => a > b ? a : b);
  }

  Color _getColorForSeason(String season) {
    switch (season) {
      case 'Primavera':
        return Colors.pink;
      case 'Verão':
        return Colors.yellow;
      case 'Outono':
        return Colors.orange;
      case 'Inverno':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
