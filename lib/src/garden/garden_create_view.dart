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

  String _gardenName = '';
  String _location = '';
  double _size = 0.0;
  final Set<PlantItem> _plants = {};
  final String _gardenImageName =
      'default.png'; // Placeholder para o nome da imagem

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
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Localização',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira a localização da horta';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tamanho (m²)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o tamanho da horta';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor insira um número válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _size = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Criação de um novo GardenItem com os dados do formulário
                    final newGarden = GardenItem(
                      1, // Id fictício da horta (deve ser gerado automaticamente)
                      _gardenName,
                      _plants,
                      _gardenImageName,
                      _location,
                      _size,
                    );

                    // Lógica para salvar a nova horta (adicionar à lista ou banco de dados)

                    Navigator.pop(context); // Voltar à tela anterior
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
