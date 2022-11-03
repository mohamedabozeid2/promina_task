import 'package:flutter/material.dart';

import '../../../../../../core/utils/helper.dart';

class DefaultSizedBox extends StatelessWidget {
  const DefaultSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helper.getScreenHeight(context: context)*0.05,
    );
  }
}
