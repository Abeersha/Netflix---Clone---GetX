import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/api/service/netflix_service.dart';

class NetflixCOntroller extends GetxController {
 
  List<NetflixModel> released = [];
   List<NetflixModel> popular = [];
    List<NetflixModel> trending = [];
     List<NetflixModel> newMovies = [];
      List<NetflixModel> topRated = [];
       List<NetflixModel> arrivingToday= [];
        List<NetflixModel> tvandMovies = [];

  var Loading = true.obs;


  Future<List<NetflixModel>> getdata(String Url) async {
    Loading.value =true;

    try {
      var data = await NetflixService().getMethod(Url);
      Loading.value=false;
      return data!;
    } catch (e) {
      Get.snackbar('error occured', '$e');
       Loading.value=false;
      return [];
    }
  }
  @override
  void onInit() {
    getdata(urls[0]).then((value) {
      released=value;
    });
    getdata(urls[1]).then((value) {
      popular= value;
      
    });
     getdata(urls[2]).then((value) {
      trending= value;
      
    });
      getdata(urls[3]).then((value) {
      newMovies= value;
      
    });
     getdata(urls[4]).then((value) {
      topRated= value;

      
    });
       getdata(urls[5]).then((value) {
      arrivingToday=value;
      
      
    });
        getdata(urls[6]).then((value) {
      tvandMovies=value;
      
      
    });
    // TODO: implement onInit
    super.onInit();
  }
}
