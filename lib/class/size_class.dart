class SizeModel {
  final String name;
  final double width;
  final double height;

  SizeModel({
    required this.name,
    required this.width,
    required this.height,
  });
}

List<SizeModel> sizeList = [
  SizeModel(name: 'S', width: 20, height: 30),
  SizeModel(name: 'M', width: 30, height: 40),
  SizeModel(name: 'L', width: 40, height: 50),
];
