import 'package:flutter/material.dart';

import '../../core/resources/_r.dart';

class TabBarBasic extends StatelessWidget {
  final List<Widget> tabs;
  const TabBarBasic({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: R.color.gray.shade200, width: 1.0),
            ),
          ),
        ),
        TabBar(
          overlayColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.focused) ? null : R.color.transparent),
          isScrollable: true,
          labelColor: R.color.primary,
          unselectedLabelColor: R.color.gray.shade500,
          labelStyle: TextStyle(fontSize: 16.0, fontFamily: R.fonts.interSemiBold, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 16.0, fontFamily: R.fonts.interSemiBold, fontWeight: FontWeight.w600),
          indicatorColor: R.color.primary,
          indicator: BoxDecoration(
            color: R.color.primary.shade50,
            border: Border(bottom: BorderSide(width: 2.0, color: R.color.primary)),
          ),
          tabs: tabs,
        ),
      ],
    );
  }
}
