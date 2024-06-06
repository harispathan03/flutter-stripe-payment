class WardrobeScreenArguments {
  final int userId;
  final int categoryId;
  final int subCategoryId;
  final String categoryName;
  final String subCategoryName;

  WardrobeScreenArguments(
      {required this.userId,
      required this.categoryId,
      required this.subCategoryId,
      required this.categoryName,
      required this.subCategoryName});
}
