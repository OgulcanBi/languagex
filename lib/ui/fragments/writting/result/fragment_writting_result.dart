import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/fragments/writting/result/vm_fragment_writting_result.dart';
import 'package:languagex/ui/widgets/widgets_annual_leave_indicator.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../../core/resources/_r.dart';

class FragmentWrittingResult extends StatefulWidget {
  final String result;
  const FragmentWrittingResult({Key? key, required this.result}) : super(key: key);

  @override
  State<FragmentWrittingResult> createState() => _FragmentWritingResultState();
}

class _FragmentWritingResultState extends State<FragmentWrittingResult> with AutomaticKeepAliveClientMixin<FragmentWrittingResult>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentWritingResult>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentWritingResult(
        systemPadding(context).top,
        apiService(context),
      ),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              R.color.gray.shade300,
              R.color.gray.shade400,
            ],
          ),
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentWritingResult viewModel) {
    return SlideInLeft(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),

              SvgPicture.asset(
                R.drawable.svg.writingResult,
                height: 20.0,
              ),
              TextBasic(
                text: "Your Result is here:",
                color: R.color.bottomNavigatorColor,
                fontFamily: R.fonts.interSemiBold,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),

              TextBasic(
                text: "Upload your essays and let’s score!",
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                textAlign: TextAlign.center,


              ),
              SizedBox(height: 16),

              AnnualLeaveIndicator(description: "Your overall score is 10% ", totalDays: 100, remainingDays: 10),
              SizedBox(height: 8),

              TextBasic(
                text: "Your Mistakes",
                color: R.color.black,
                fontFamily: R.fonts.interSemiBold,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              TextBasic(
                text: widget.result,
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
