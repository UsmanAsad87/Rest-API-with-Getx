import "package:get/state_manager.dart";
import 'package:rest_api_with_getx/models/product.dart';
import 'package:rest_api_with_getx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = List<Product>.empty(growable: true).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var product = await RemoteServices.fetchProduct();
      if (product != null) {
        productList.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}
