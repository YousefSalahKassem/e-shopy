abstract class IProducts{
  Future<List> getAllProducts();
  Future<List> getProductByCategoryOrName(String category);
  Future<List> getProductByCategory(String category);
}