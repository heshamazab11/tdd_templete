import 'package:get/get.dart';
import 'package:tdd_templete/features/domain/model/product_model.dart';
import 'package:tdd_templete/features/domain/repository/repository.dart';

class HomeController extends GetxController {
  late Repository? repository;

  HomeController({this.repository});

  final products = <ProductModel>[].obs;
  final load = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    load.value=true;
    (await repository!.getModel()).fold((failuer) => print("sss"), (sucess) {
      print("gggg");
      products.addAll(sucess);
      print(products.length);
    });
    load.value=false;


  }

  get() async {
    await repository!.getModel();
  }
}
