import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:languagex/ui/widgets/widget_app_bar.dart';
import 'package:languagex/ui/widgets/widget_button.dart';
import '../../../core/resources/_r.dart';
import '../../base/base_view.dart';
import 'vm_file_viewer.dart';

class ViewFileViewer extends StatelessWidget with BaseView {
  final String path;
  final bool isNetwork;
  const ViewFileViewer({
    Key? key,
    required this.path,
    this.isNetwork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBase<ViewModelFileViewer>(
      statusbarBrightness: router(context).uiBrightnessStyle.light(systemNavigationBarColor: R.color.black),
      model: ViewModelFileViewer(),
      builder: (context, viewModel) {
        initListener(context, viewModel);
        return Scaffold(
          backgroundColor: R.color.black,
          body: _getBody(context, viewModel),
        );
      },
    );
  }

  Widget _getBody(BuildContext context, ViewModelFileViewer viewModel) {
    final mimeType = lookupMimeType(path);
    if (mimeType == null) {
      return Container();
    }
    final isImage = mimeType.startsWith('image/');
    final isPDF = mimeType.startsWith('application/pdf');
    return Stack(
      children: [
        Container(
          child: isImage
              ? Hero(
                  tag: path,
                  child: PhotoView(imageProvider: (isNetwork ? NetworkImage(path) : FileImage(File(path))) as ImageProvider<Object>))
              : isPDF
                  ? isNetwork
                      ? SfPdfViewer.network(path)
                      : SfPdfViewer.file(File(path))
                  : Container(),
        ),
        Positioned(
          left: 12.0,
          top: systemPadding(context).top + 20.0,
          child: AppbarBackButton(
            bgColor: R.color.white,
            iconColor: R.color.black,
            onPressed: () => router(context).onBackPressed(),
          ),
        ),
      ],
    );
  }
}
