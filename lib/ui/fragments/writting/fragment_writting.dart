import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:languagex/core/services/router.gr.dart';
import 'package:languagex/ui/base/base_view.dart';
import 'package:languagex/ui/fragments/writting/vm_fragment_writting.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import 'package:languagex/ui/widgets/widgets_text.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../../core/resources/_r.dart';
import '../../widgets/widget_app_bar.dart';
import '../../widgets/widget_textfield.dart';

class FragmentWritting extends StatefulWidget {
  const FragmentWritting({Key? key}) : super(key: key);

  @override
  State<FragmentWritting> createState() => _FragmentWrittingState();
}

class _FragmentWrittingState extends State<FragmentWritting> with AutomaticKeepAliveClientMixin<FragmentWritting>, BaseView {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WidgetBase<ViewModelFragmentWritting>(
      isActiveLoadingIndicator: true,
      model: ViewModelFragmentWritting(
        systemPadding(context).top,
        apiService(context),
      ),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return ScaffoldGradientBackground(
          appBar: _getAppBar(
            context,
            viewModel,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              R.color.gray.shade300,
              R.color.gray.shade400,
            ],
          ),
          body: _getBody(context, viewModel),
          bottomNavigationBar: _getTakePhotoButton(context,viewModel),
        );
      },
    );
  }

  AppBarBasic _getAppBar(BuildContext context, ViewModelFragmentWritting viewModel) {
    return AppBarBasic(
      bgColor: R.color.gray.shade700,
      leading: SvgPicture.asset(
        R.drawable.svg.logo,
        height: 20.0,
      ),
      bottomBorderColor: R.color.bottomNavigatorColor,
    );
  }

  List<Widget> headerSliverBuilder(BuildContext context, ViewModelFragmentWritting viewModel) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverSafeArea(
          top: false,
          sliver: SliverAppBar(
            expandedHeight: systemPadding(context).top + 40.0,
            floating: false,
            pinned: true,
            backgroundColor: R.color.viewBg,
            elevation: 0.0,
            leading: Container(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              background: Container(color: R.color.viewBg),
              titlePadding: const EdgeInsets.symmetric(vertical: 4.0),
              title: Container(
                width: size(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextBasic(
                  text: R.string.projectFinanceTitle,
                  color: R.color.gray.shade900,
                  fontFamily: R.fonts.interSemiBold,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Container(
              width: size(context).width,
              color: R.color.viewBg,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextBasic(
                text: R.string.projectFinanceDescription,
                color: R.color.gray.shade600,
                fontFamily: R.fonts.interRegular,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _getDescriptionField(BuildContext context, ViewModelFragmentWritting viewModel) {
    return FadeInRight(
      child: TextFieldBasic(
        controller: viewModel.descriptionController,
        hintText: R.string.forecastReplyHint,
        title: R.string.description,
        maxLines: viewModel.descriptionController.text.length > 100 ? 30 : 10,
      ),
    );
  }

  Widget _getBody(BuildContext context, ViewModelFragmentWritting viewModel) {
    return SlideInLeft(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (textScanning) const CircularProgressIndicator(),
              if (imageFile != null) Image.file(File(imageFile!.path)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(R.color.bottomNavigatorColor)),
                      onPressed: () {
                        getImage(ImageSource.gallery,viewModel);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.image,
                            size: 30,
                          ),
                          SizedBox(width: 4.0),
                          TextBasic(
                            text: "Gallery",
                            color: Colors.white,
                            fontFamily: R.fonts.interSemiBold,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(R.color.bottomNavigatorColor)),
                      onPressed: () {
                        getImage(ImageSource.camera,viewModel);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          SizedBox(width: 4.0),
                          TextBasic(
                            text: "Take a photo",
                            color: Colors.white,
                            fontFamily: R.fonts.interSemiBold,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _getDescriptionField(context, viewModel),

            ],
          ),
        ),
      ),
    );
  }

  void getImage(ImageSource source,ViewModelFragmentWritting viewModel) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage,viewModel);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image,ViewModelFragmentWritting viewModel) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    var recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text;
      }
    }
    viewModel.descriptionController.text = scannedText;

    textScanning = false;
    setState(() {});
  }

  Widget _getTakePhotoButton(BuildContext context,ViewModelFragmentWritting viewModel) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: ButtonBasic(
        bgColor: R.color.bottomNavigatorColor,
        onPressed: () async {
          String text = viewModel.descriptionController.text;

          router(context).startNewView(route: FragmentWrittingResultRoute(result: await viewModel.checkText(text)));
        },
        text: 'test',
        fontFamily: R.fonts.interSemiBold,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
    );
  }
}
