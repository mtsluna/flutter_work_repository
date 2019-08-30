import 'package:login_app/src/models/product_model.dart';
import 'package:login_app/src/providers/product_provider.dart';
import 'package:rxdart/subjects.dart';

class ProductBloc{

  final _productController = new BehaviorSubject<List<Product>>();
  final _chargeController = new BehaviorSubject<bool>();

  final _productProvider = new ProductProvider();

  Stream<List<Product>> get getProductStream => _productController.stream;
  Stream<bool> get postoProductStream => _chargeController.stream;

  void getProduct() async {
    final product = await _productProvider.get();
    _productController.sink.add(product);
  }

  void postProduct(Product product) async {
    _chargeController.sink.add(true);
    await _productProvider.post(product);
    _chargeController.sink.add(false);
  }

  void putProduct(Product product) async {
    _chargeController.sink.add(true);
    await _productProvider.put(product);
    _chargeController.sink.add(false);
  }

  void deleteProduct(String id) async {
    _chargeController.sink.add(true);
    await _productProvider.delete(id);
    _chargeController.sink.add(false);
  }

  dispose(){
    _productController?.close();
    _chargeController?.close();
  }

}