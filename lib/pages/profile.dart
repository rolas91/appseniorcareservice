import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seniorcare/api/seniorcare_api.dart';
import 'package:seniorcare/models/user.dart';
import 'package:seniorcare/utils/auth.dart';
import 'package:seniorcare/utils/dialogs.dart';
import 'package:seniorcare/utils/extras.dart';
import 'package:seniorcare/widgets/avatar_button.dart';

class Profile extends StatefulWidget {
  static const routeName = 'home';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> with AfterLayoutMixin {
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
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            this.user == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                      AvatarButton(
                        imageSize: 100,
                        url: this.user.avatar,
                        onPressed: this._pickImage,
                      ),
                      Text(this.user.username),
                      Text(this.user.email),
                      Text(this.user.date.toString()),
                    ],
                  ),
            FlatButton(
              child: Text("Log Out"),
              onPressed: () => Auth.instance.logOut(context),
            ),
          ],
        ),
      ),
    ));
  }
}
