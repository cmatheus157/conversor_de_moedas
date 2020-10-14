import 'package:conversor_de_moedas/app/modules/login/widgets/login_social_button.dart';
import 'package:conversor_de_moedas/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:conversor_de_moedas/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.more_vert_rounded), onPressed: () {})
        ],
        title: Text('Login to your app'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Username or Email',
                      hintStyle: TextStyle(color: Colors.black87)),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black87)),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: Color(0xFFFFD185),
                    textColor: Colors.white,
                    child: Text(
                      'LOG IN',
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.CONVERSION);
                    },
                  ),
                ),
              ),
              Divider(),
              loginSocialButton(
                'FACEBOOK',
                Color(0xFF3C4858),
                FaIcon(FontAwesomeIcons.facebookSquare),
              ),
              loginSocialButton(
                'TWITTER',
                Color(0xFF8492A6),
                FaIcon(FontAwesomeIcons.twitter),
              ),
              loginSocialButton(
                'GOOGLE',
                Color(0xFFC0CCDA),
                FaIcon(FontAwesomeIcons.google),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
