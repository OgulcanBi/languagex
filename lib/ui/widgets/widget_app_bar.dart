import 'package:flutter/material.dart';

import '/core/resources/_r.dart';
import '/ui/widgets/widget_button.dart';
import '/ui/widgets/widgets_text.dart';
import '../base/base_view.dart';

class AppBarBasic extends StatelessWidget with BaseView implements PreferredSize {
  final Widget? title;
  final String? titleText;
  final Widget? trailing;
  final Widget? leading;
  final Function? onPressedBackButton;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final bool? isActiveTrailingPadding;
  final bool isActiveBackButton;
  final TextAlign? textAlign;
  final Color? bottomBorderColor;

  const AppBarBasic({
    Key? key,
    this.title,
    this.titleText,
    this.trailing,
    this.leading,
    this.onPressedBackButton,
    this.bgColor,
    this.padding,
    this.isActiveTrailingPadding = true,
    this.isActiveBackButton = true,
    this.textAlign = TextAlign.center,
    this.bottomBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: padding ??
            const EdgeInsets.only(
              left: 20.0,
              top: 40.0,
              right: 20.0,
            ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: bottomBorderColor ?? R.color.gray.shade200)),
          color: bgColor ?? R.color.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            leading != null ? leading! : !isActiveBackButton ? Container() : AppbarBackButton(
              bgColor: R.color.white,
              iconColor: R.color.black,
              onPressed: () {
                if (onPressedBackButton == null) {
                  router(context).onBackPressed();
                } else {
                  onPressedBackButton!();
                }
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  right: isActiveTrailingPadding! ? 12.0 : 0.0,
                  left: 12.0,
                ),
                margin: EdgeInsets.only(
                  right: trailing == null && isActiveBackButton ? 40.0 : 0.0,
                ),
                child: title ??
                    (titleText == null
                        ? Container()
                        : TextBasic(
                            text: titleText!,
                            color: R.color.black,
                            fontFamily: R.fonts.interBold,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            textAlign: textAlign,
                          )),
              ),
            ),
            trailing != null ? trailing! : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => Size(double.infinity, AppBar().preferredSize.height);
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.child);

  final Widget child;

  @override
  double get minExtent => TabBar(tabs: []).preferredSize.height;
  @override
  double get maxExtent => TabBar(tabs: []).preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) => false;
}
