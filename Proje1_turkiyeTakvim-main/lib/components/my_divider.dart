import 'package:flutter/material.dart';

import '../constant.dart';


class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 400,
      child: const Divider(
        color: Colors.transparent,
        height: 1,
        thickness: 1,
      ),
    );
  }
}
