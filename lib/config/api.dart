abstract class ApiConfig {
  static const String baseURL = "https://fakestoreapi.com";
  static const String products = "/products";
  static const String categories = "$products/categories";
  static String categoryProducts(String category) =>
      "$products/category/$category";
}
