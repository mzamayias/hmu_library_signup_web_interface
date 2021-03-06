import 'package:flutter/material.dart';

class DefaultView extends StatelessWidget {
  final List<Widget> headerChildren;
  final List<Widget> contentChildren;

  const DefaultView({
    Key? key,
    required this.headerChildren,
    required this.contentChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: const Color(0xFFEEE9DF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: headerChildren,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: const Color(0XFFFFFFFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: contentChildren,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
