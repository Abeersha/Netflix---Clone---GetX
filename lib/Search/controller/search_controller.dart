import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/search_model.dart';
import '../service/search_services.dart';

class SearchController extends GetxController{
  var loading = true.obs;
  // RxList<SearchModel> data = <SearchModel>[].obs;
  RxList data = [].obs;
  putData(query) async{
    // data.value = await SerachService().postMethod(query);
    data.value = await SearchService().postMethod(query);
  }
  @override
  void onInit() {
    putData('');
    super.onInit();
  }
}