import 'package:flutter/material.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
import 'package:seeds/src/garden/garden_item.dart';
import 'package:seeds/src/plant/plant_item.dart';

class GardenCreateView extends StatefulWidget {
  const GardenCreateView({super.key});

  static const routeName = '/gardens/create';

  @override
  _GardenCreateViewState createState() => _GardenCreateViewState();
}

class _GardenCreateViewState extends State<GardenCreateView> {
  final _formKey = GlobalKey<FormState>();

  String _gardenName = ''; // To store garden name input
  final Set<PlantItem> _plants = {}; // Placeholder for garden's plants
  final String _gardenImageName = 'water-lily.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Nova Horta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome da Horta',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o nome da horta';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gardenName = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // You can create a new GardenItem with the form data
                    final newGarden =
                        GardenItem(1, _gardenName, _plants, _gardenImageName);

                    // Here you can add the logic to save the garden to a database or state management

                    // Pop back to the previous screen or show a confirmation
                    Navigator.pop(context);
                  }
                },
                child: const Text('Cadastrar Horta'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: -1),
    );
  }
}
