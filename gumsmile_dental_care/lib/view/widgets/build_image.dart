import 'package:flutter/material.dart';

Widget buildImage(image, index) => Container(
      width: 500,
      color: Colors.grey,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
