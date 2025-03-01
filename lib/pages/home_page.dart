import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seniorcare/api/seniorcare_api.dart';
import 'package:seniorcare/models/user.dart';
import 'package:seniorcare/tabs/bottom/applied.dart';
import 'package:seniorcare/tabs/bottom/awarded.dart';
import 'package:seniorcare/tabs/bottom/open.dart';
import 'package:seniorcare/utils/auth.dart';
import 'package:seniorcare/utils/dialogs.dart';
import 'package:seniorcare/utils/extras.dart';
import 'package:seniorcare/widgets/avatar_button.dart';
import 'package:seniorcare/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  User user;

  @override
  void afterFirstLayout(BuildContext context) {
    this._init();
  }

  _init() async {
    this.user = await SeniorCareApi.instance.getUserInfo();
    setState(() {});
  }

  _pickImage() async {
    final PickedFile pickedFile = await Extras.pickImage(false);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      ProgressDialog progressDialog = ProgressDialog(context);
      progressDialog.show();
      final String result =
          await SeniorCareApi.instance.updateAvatar(bytes, pickedFile.path);
      progressDialog.dissmiss();
      if (result != null) {
        this.user = this.user.setAvatar(result);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Senior Care"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Open",
                    icon: Icon(Icons.receipt),
                  ),
                  Tab(
                    text: "Applied",
                    icon: Icon(Icons.check_box),
                  ),
                  Tab(
                    text: "Awarded",
                    icon: Icon(Icons.star),
                  )
                ],
              ),
            ),
            drawer: SideDrawer(),
            body: TabBarView(
              children: [Open(), Applied(), Awarded()],
            )));
  }
}
