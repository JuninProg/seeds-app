import 'package:flutter/material.dart';
import 'package:seeds/src/components/navbar/bottom_navigation_bar.dart';
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
  _PlantCreateViewState createState() => _PlantCreateViewState();
}

class _PlantCreateViewState extends State<PlantCreateView> {
  final _formKey = GlobalKey<FormState>();

  String _plantName = '';
  String _description = '';
  String _imageName = 'default.png'; // Placeholder para o nome da imagem
  String _type = 'Fruta'; // Valor padrão
  String _season = 'Primavera'; // Valor padrão
  int _daysToSprout = 0;

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
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Tipo de Planta',
                ),
                value: _type,
                items: const [
                  DropdownMenuItem(value: 'Fruta', child: Text('Fruta')),
                  DropdownMenuItem(value: 'Vegetal', child: Text('Vegetal')),
                  DropdownMenuItem(value: 'Flor', child: Text('Flor')),
                ],
                onChanged: (value) {
                  setState(() {
                    _type = value!;
                  });
                },
                onSaved: (value) {
                  _type = value!;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Estação do Ano',
                ),
                value: _season,
                items: const [
                  DropdownMenuItem(
                      value: 'Primavera', child: Text('Primavera')),
                  DropdownMenuItem(value: 'Verão', child: Text('Verão')),
                  DropdownMenuItem(value: 'Outono', child: Text('Outono')),
                  DropdownMenuItem(value: 'Inverno', child: Text('Inverno')),
                ],
                onChanged: (value) {
                  setState(() {
                    _season = value!;
                  });
                },
                onSaved: (value) {
                  _season = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Dias para Brotar',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira os dias para brotar';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _daysToSprout = int.parse(value!);
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
                      _type,
                      _season,
                      _daysToSprout,
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: -1),
    );
  }
}
