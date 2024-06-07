import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Uint8List> createCustomMarkerWithNumber(int number) async {
  final ByteData data = await rootBundle.load('assets/images/marker.png');
  final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  final ui.FrameInfo fi = await codec.getNextFrame();
  final ui.Image baseImage = fi.image;

  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(
      pictureRecorder, Rect.fromPoints(Offset(0, 0), Offset(baseImage.width.toDouble(), baseImage.height.toDouble())));

  canvas.drawImage(baseImage, const Offset(0, 0), Paint());

  final textPainter = TextPainter(
    text: TextSpan(
      text: number.toString(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 36,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout();

  final double offsetX = (baseImage.width - textPainter.width) / 2.5;
  final double offsetY = (baseImage.height - textPainter.height) / 3.5;

  textPainter.paint(
    canvas,
    Offset(offsetX, offsetY),
  );

  final img = await pictureRecorder.endRecording().toImage(baseImage.width, baseImage.height);
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  return byteData!.buffer.asUint8List();
}

Future<BitmapDescriptor> getCustomMarker(int number) async {
  final Uint8List markerImage = await createCustomMarkerWithNumber(number);
  return BitmapDescriptor.fromBytes(markerImage);
}
