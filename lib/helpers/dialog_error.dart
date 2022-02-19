import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showError(
  BuildContext context,
  String titleText,
  String descTitle,
  String buttonText,
) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Platform.isAndroid) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(descTitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Продолжить"),
            )
          ],
        );
      } else {
        return CupertinoAlertDialog(
          title: Text(titleText),
          content: Text(descTitle),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText),
            )
          ],
        );
      }
    },
  );
}
