import 'package:flutter/material.dart';
import 'package:flutter_watch_store/widgets/watch_avatar_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WatchAvatar(onTextPress: () {})
          ],
        ),
      ),
    );
  }
}