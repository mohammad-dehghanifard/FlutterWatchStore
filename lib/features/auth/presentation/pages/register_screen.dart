import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_watch_store/core/resources/texts.dart';
import 'package:flutter_watch_store/core/widgets/watch_app_bar.dart';
import '../../../../gen/assets.gen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[],
          ),
        ),
      ),
    );
  }
}

