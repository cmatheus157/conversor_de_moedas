import 'package:conversor_de_moedas/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget loginSocialButton(String name,Color cor,Widget icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
        color: cor,
        textColor: Colors.white,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child:icon),
            Align(
              alignment: Alignment.center,
              child: Text(
                'LOGIN WiTH '+name,
              ),
            ),
          ],
        ),
        onPressed: () {
          Get.toNamed(Routes.CONVERSION);
        },
      ),
    ),
  );
}
