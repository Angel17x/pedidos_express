import 'package:flutter/material.dart';

import '../styles/color.dart';
import '../styles/text.dart';

Widget? showError({String? error}){
  return Column(
    children: [
      SizedBox(height: 5),
      Row(
        children: [
          SizedBox(width: 20),
          Expanded(
            child: Text(
              error ?? "",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

