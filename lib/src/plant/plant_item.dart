class PlantItem {
  const PlantItem(
    this.id,
    this.gardenId,
    this.name,
    this.description,
    this.imageName,
    this.type,
    this.season,
    this.daysToSprout,
  );

  final int id;
  final int gardenId;
  final String name;
  final String description;
  final String imageName;
  final String type; // Tipo da planta (e.g., "Fruta", "Vegetal", "Flor")
  final String season; // Estação do ano (e.g., "Primavera", "Verão")
  final int daysToSprout; // Dias restantes para brotar
}
