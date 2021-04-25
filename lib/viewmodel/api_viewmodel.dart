import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getxstarted/core/model/post_model.dart';
import 'package:getxstarted/core/services/api_services.dart';

enum GetPostEnum { Loaded, Loading, Error, Inital }

class ApiViewModel extends GetxController {
  ApiServices _apiServices = ApiServices();

  GetPostEnum getPostEnum = GetPostEnum.Inital;
  List<PostModel> myList = [];

  Future getAllPosts() {
    getPostEnum = GetPostEnum.Loading;
    myList.clear();
    update();
    _apiServices.getAllPosts().then((value) {
      if (value != false) {
        for (var post in value) {
          myList.add(PostModel.fromJson(post));
        }
        getPostEnum = GetPostEnum.Loaded;
        update();
      } else {
        print('Postlar çekilirken bir sorun oluştu...');
        getPostEnum = GetPostEnum.Error;
        update();
      }
    });
  }
}
