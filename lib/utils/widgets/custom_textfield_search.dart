import 'package:flutter/material.dart';
import 'package:test_berita/utils/values/my_values.dart';
import 'package:test_berita/utils/widgets/custom_card.dart';

class CustomTextfieldSearch extends StatefulWidget {
  final TextEditingController controller;
  final Function() onSubmit;
  const CustomTextfieldSearch({
    Key? key,
    required this.controller,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _CustomTextfieldSearchState createState() => _CustomTextfieldSearchState();
}

class _CustomTextfieldSearchState extends State<CustomTextfieldSearch> {
  bool _isClear = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: Theme.of(context).textTheme.bodyText1,
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.bodyText1,
          hintText: MyValues.search,
          prefixIcon: IconButton(
            onPressed: widget.onSubmit,
            icon: Icon(
              Icons.search,
            ),
          ),
          suffixIcon: _isClear
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.text = '';
                      _isClear = false;
                    });
                  },
                  icon: Icon(Icons.close),
                )
              : SizedBox(),
        ),
        onChanged: (val) {
          if (val == '') {
            setState(() {
              _isClear = false;
            });
          } else {
            setState(() {
              _isClear = true;
            });
          }
        },
        onSubmitted: (val) {
          widget.onSubmit();
        },
      ),
    );
  }
}
