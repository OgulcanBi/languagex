import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:languagex/core/resources/_r.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FileViewer extends StatelessWidget {
  final File item;
  final Function() onTapItem;
  final Function()? onTapRemove;
  const FileViewer({super.key, required this.item, required this.onTapItem, required this.onTapRemove});

  @override
  Widget build(BuildContext context) {
    final mimeType = lookupMimeType(item.path);
    if (mimeType == null) return Container();
    final isImage = mimeType.startsWith('image/');
    final isPDF = mimeType.startsWith('application/pdf');
    return GestureDetector(
      onTap: () => onTapItem(),
      child: Container(
        height: 144.0,
        width: 64.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isImage
                ? Hero(tag: item.path, child: Image.file(item, height: 94.0, fit: BoxFit.cover))
                : isPDF
                    ? Container(
                        height: 94.0,
                        width: 64.0,
                        child: Stack(
                          children: [
                            SfPdfViewer.file(item, canShowScrollHead: false),
                            Positioned(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0, child: GestureDetector(onTap: () => onTapItem()))
                          ],
                        ),
                      )
                    : Container(),
            const SizedBox(height: 4.0),
            onTapRemove == null ? Container() : GestureDetector(onTap: () => onTapRemove!(), child: Icon(Icons.clear, color: R.color.error)),
          ],
        ),
      ),
    );
  }
}
