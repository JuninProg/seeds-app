import 'package:flutter/material.dart';
import 'package:seeds/src/garden/garden_item.dart';
import 'package:seeds/src/plant/plant_item.dart';

class PlantCreateView extends StatefulWidget {
  const PlantCreateView({
    super.key,
    required this.gardenItem,
  });

  static const routeName = '/plants/create';
  final GardenItem gardenItem;

  @override
  _RegisterPlantViewState createState() => _RegisterPlantViewState();
}

class _RegisterPlantViewState extends State<PlantCreateView> {
  final _formKey = GlobalKey<FormState>();

  String _plantName = '';
  String _description = '';
  String _imageName = 'default.png'; // Placeholder para o nome da imagem

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Nova Planta'),
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
                  labelText: 'Nome da Planta',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da planta';
                  }
                  return null;
                },
                onSaved: (value) {
                  _plantName = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(height: 20),
              // Campo para escolher a imagem da planta (placeholder)
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Criação de um novo PlantItem
                    final newPlant = PlantItem(
                      1, // Id fictício da planta (deve ser gerado automaticamente)
                      widget.gardenItem.id,
                      _plantName,
                      _description,
                      _imageName,
                    );

                    // Lógica para salvar a nova planta (adicionar à lista ou banco de dados)

                    Navigator.pop(context); // Voltar à tela anterior
                  }
                },
                child: const Text('Registrar Planta'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Detalhes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Nova Planta',
          ),
        ],
        currentIndex: 1, // Estamos na tela de registro da planta
        onTap: (int index) {
          if (index == 0) {
            // Navegar para a tela de detalhes da horta
            Navigator.pop(context); // Volta para a tela anterior (detalhes)
          }
        },
      ),
    );
  }
}
