import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:seeds/src/plant/plant_item.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key, required this.items});

  final List<PlantItem> items;

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Tipos de Plantas',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildLegend(),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final Map<String, int> typeCounts = {};
    final totalPlants = widget.items.length;

    for (var plant in widget.items) {
      typeCounts[plant.type] = (typeCounts[plant.type] ?? 0) + 1;
    }

    return typeCounts.entries.map((entry) {
      final isTouched = entry.key.hashCode == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final percentage = (entry.value / totalPlants * 100).toStringAsFixed(1);
      return PieChartSectionData(
        color: _getColorForType(entry.key),
        value: entry.value.toDouble(),
        title: '$percentage%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    }).toList();
  }

  Widget _buildLegend() {
    final Map<String, int> typeCounts = {};

    for (var plant in widget.items) {
      typeCounts[plant.type] = (typeCounts[plant.type] ?? 0) + 1;
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: typeCounts.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color: _getColorForType(entry.key),
                ),
                const SizedBox(width: 8),
                Text(
                  '${entry.key} (${entry.value})',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'Fruta':
        return Colors.red;
      case 'Vegetal':
        return Colors.green;
      case 'Flor':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
