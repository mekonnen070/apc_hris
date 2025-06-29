import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>
    with TickerProviderStateMixin {
  final MobileScannerController controller = MobileScannerController();
  late AnimationController _animationController;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 250,
      height: 250,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.lango.scanEmployeeId,
        ), // <-- REPLACED & REMOVED CONST
        actions: [
          // Torch control button
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => controller.toggleTorch(),
          ),
          // Camera switch button
          IconButton(
            icon: const Icon(Icons.flip_camera_ios),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            controller: controller,
            scanWindow: scanWindow,
            onDetect: (capture) {
              if (_isProcessing) return;

              final barcode = capture.barcodes.firstOrNull;
              if (barcode?.rawValue != null) {
                setState(() {
                  _isProcessing = true;
                });
                Navigator.of(context).pop(barcode!.rawValue);
              }
            },
          ),
          // Custom Painter for scanner overlay and animated line
          CustomPaint(
            painter: _ScannerOverlayPainter(scanWindow, _animationController),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  final Rect scanWindow;
  final Animation<double> animation;

  _ScannerOverlayPainter(this.scanWindow, this.animation)
    : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath =
        Path()..addRRect(
          RRect.fromRectAndCorners(
            scanWindow,
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
        );

    final backgroundPaint =
        Paint()
          ..color = Colors.black.withValues(alpha: 0.6)
          ..style = PaintingStyle.fill
          ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );
    canvas.drawPath(backgroundWithCutout, backgroundPaint);

    final borderPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        scanWindow,
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ),
      borderPaint,
    );

    // Animated Scan Line
    final scanLinePaint =
        Paint()
          ..color = Colors.greenAccent
          ..strokeWidth = 4.0
          ..shader = const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.greenAccent,
              Colors.transparent,
            ],
            stops: [0.0, 0.5, 1.0],
          ).createShader(Rect.fromLTWH(0.0, 0.0, scanWindow.width, 0.0));

    final y = scanWindow.top + scanWindow.height * animation.value;
    canvas.drawLine(
      Offset(scanWindow.left, y),
      Offset(scanWindow.right, y),
      scanLinePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScannerOverlayPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value;
  }
}
