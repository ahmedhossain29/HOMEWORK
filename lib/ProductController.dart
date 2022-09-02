import 'package:get/get.dart';
import 'package:homework/product_master.dart';
import 'package:homework/product_repository.dart';

class ProductController extends GetxController {
  final ProductRepository productRepository;
  ProductController({required this.productRepository});
  Product? product;
  List<Product>? _productsList;
  List<Categories>? _categoryList;
  List<String>? _productImages;
  bool _isVisible = false;
  Categories? _category;

  Product? get getProduct => product;
  Categories? get getCategory => _category;
  List<Product> get productsList => _productsList ?? [];
  List<Categories> get categoryList => _categoryList ?? [];
  List<String> get productImages => _productImages ?? [];
  bool get isVisible => _isVisible;

  Future<void> getAllProducts(bool reload) async {
    if (_productsList == null || reload) {
      Response response = await productRepository.getAllProducts();
      if (response.statusCode == 200) {
        _productsList = [];
        response.body['products']['data'].forEach((product) {
          _productsList!.add(Product.fromJson(product));
        });
      }
      _isVisible = true;
      update();
    }
  }

  Future<void> getProductById(int? productId, bool reload) async {
    _productImages = [];
    product = _productsList?.firstWhere((p) => p.id == productId);
      for(int i =0; i < 4; i++){
        _productImages!.add(product!.thumbImage!);
      }
    _isVisible = true;
    update();
  }

  Future<void> getAllCategories(bool reload) async {
    if (_categoryList == null || reload) {
      Response response = await productRepository.getAllProducts();
      if (response.statusCode == 200) {
        _categoryList = [];
        response.body['categories'].forEach((category) {
          _categoryList!.add(Categories.fromJson(category));
        });
        print('==============----ccc getAllCategories---------${_categoryList![0]}==============-------------');
        _isVisible = true;
      } else {}
      update();
    }
  }

  Future<void> getCategoryNameByProductId(String? productCategoryId, bool reload) async {
    _category = _categoryList?.firstWhere((p) => p.id == int.parse(productCategoryId!));
    print('==============----nnn Category name---------${_category?.name}==============-------------');
    _isVisible = true;
    update();
  }
}
