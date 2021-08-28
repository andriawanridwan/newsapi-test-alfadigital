class CategoryModel {
  String id;
  String name;
  String svgPath;
  CategoryModel({
    required this.id,
    required this.name,
    required this.svgPath,
  });
}

List<CategoryModel> listCategory = [
  CategoryModel(
    id: 'business',
    name: 'Business',
    svgPath: 'assets/icons/business.svg',
  ),
  CategoryModel(
    id: 'entertainment',
    name: 'Entertainment',
    svgPath: 'assets/icons/entertainment.svg',
  ),
  CategoryModel(
    id: 'general',
    name: 'General',
    svgPath: 'assets/icons/general.svg',
  ),
  CategoryModel(
    id: 'health',
    name: 'Health',
    svgPath: 'assets/icons/health.svg',
  ),
  CategoryModel(
    id: 'science',
    name: 'Science',
    svgPath: 'assets/icons/science.svg',
  ),
  CategoryModel(
    id: 'sports',
    name: 'Sports',
    svgPath: 'assets/icons/sports.svg',
  ),
  CategoryModel(
    id: 'technology',
    name: 'Technology',
    svgPath: 'assets/icons/technology.svg',
  ),
];
