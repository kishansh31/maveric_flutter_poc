import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maveric_flutter_poc/app/services/remote_services.dart';
import 'package:maveric_flutter_poc/app/utils/const_strings.dart';

// import 'model_population_list.dart';

class PopulationListController extends GetxController {

  var isLoading = false.obs;

  // var dataList = <Data>[].obs;
  var data_list;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    takeAPIcall();
  }

  void takeAPIcall() async {
    isLoading(true);
    var connectivityResult = await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.mobile) || (connectivityResult == ConnectivityResult.wifi)) {
      var resp = await sampleGetAPI();
      isLoading(false);

      data_list  = resp['data'];

      /*if(dataList.length > 0 || dataList != null){
        dataList.clear();
      }

      dataList.addAll(List.from(data_list).map<Data>((item) => Data.fromJson(item)).toList());

      print('Length for data is : '+dataList.length.toString());*/

    } else {
      isLoading(false);
      Fluttertoast.showToast(
        msg: ConstStrings.str_no_internet,
      );
    }
  }
}
