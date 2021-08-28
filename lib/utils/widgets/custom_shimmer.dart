import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_berita/utils/values/my_colors.dart';
import 'package:test_berita/utils/values/my_values.dart';

class CustomShimmer {
  static Widget card({double height = 100}) {
    return Shimmer.fromColors(
      baseColor: MyColors.primary,
      highlightColor: Colors.lightBlue[100]!,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  static Widget loadingList({double height = 100}) {
    return ListView.builder(
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Shimmer.fromColors(
          baseColor: MyColors.primary,
          highlightColor: Colors.lightBlue[100]!,
          child: Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      itemCount: MyValues.limit,
    );
  }
}
