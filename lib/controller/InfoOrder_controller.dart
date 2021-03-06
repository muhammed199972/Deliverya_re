import 'package:delivery_food/General/Api_Result.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/model/InfoOrder_model.dart';
import 'package:delivery_food/services/InfoOrder_services.dart';
import 'package:get/get.dart';

class InfoOrderController extends GetxController {
  var infoOrders = <InfoOrderResponse>[].obs;
  var hasError = true.obs;
  var massage = ''.obs;
  ApiResult apiResult = ApiResult();
  InfoOrderService infoOrderService = InfoOrderService();

  @override
  void onInit() {
    getinfoOrder();
    super.onInit();
  }

  getinfoOrder() async {
    try {
      apiResult = await infoOrderService.getinfoOrderData();
      if (apiResult.rfreshToken) {
        if (!apiResult.hasError!) {
          infoOrders.value = apiResult.data;
          hasError.value = apiResult.hasError!;
        } else {
          hasError.value = apiResult.hasError!;
          massage.value = apiResult.errorMassage!;
          DialogsUtils.showdialog(
              m: massage.value,
              onPressed: () {
                Get.back();
                Get.back();
              });
        }
      } else {
        getinfoOrder();
      }
    } catch (e) {
      hasError.value = apiResult.hasError!;
      massage.value = apiResult.errorMassage!;
      DialogsUtils.showdialog(
          m: 'حدث خطأ غير متوقع',
          onPressed: () {
            Get.back();
            Get.back();
          });
    }
  }
}
