// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QrCode extends StatefulWidget {
//   @override
//   _QrCodeState createState() => _QrCodeState();
// }
//
// class _QrCodeState extends State<QrCode> {
//   GlobalKey qrKey = GlobalKey();
//   var qrText = '';
//   QRViewController? controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//               flex: 5,
//               child: QRView(
//
//                 key: qrKey,
//                 overlay: QrScannerOverlayShape(
//                   borderRadius: 20
//                 ),
//                 onQRViewCreated: onQrCreated,)),
//
//           Expanded(
//               flex: 1,
//               child: Center(child: Text('scan result:$qrText'),))
//         ],
//       ),
//     );
//   }
//
//   void onQrCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         qrText = scanData as String;
//       });
//     });
//   }
// }
