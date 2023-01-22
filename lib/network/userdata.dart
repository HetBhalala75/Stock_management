import 'package:firstproject/network/firebase.dart';
import 'package:firstproject/screens/customerdetail/customer_detail.dart';
import 'package:firstproject/screens/finalbill/final_bill.dart';
import 'package:firstproject/screens/ownerloginpage/login_page_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

String username = " ";

usenamefunc1() async {
  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  prefs1.setString(username, loginPageUserController.text);
}

Future<String> username1() async {
  SharedPreferences prefs1 = await SharedPreferences.getInstance();
  var usenameid = prefs1.getString(username.toString());
  return usenameid!;
}

getCustomerDataFromdb() async {
  db
      .child('register')
      .child(await username1())
      .child('customers')
      .once()
      .then((value) => {
            value.value.forEach((k, v) {
              customers.add({
                "customername": v["customerProfile"]["customername"],
                "customermobile": v["customerProfile"]['customermobile'],
                "productcart": v["customerCart"]["productcart"],
                "cartTotal": v["customerCart"]["cartTotal"],
                "netPrize": v["customerCart"]["netPrize"],
                "discount": v["customerCart"]["discount"]
              });
            })
          });
}

