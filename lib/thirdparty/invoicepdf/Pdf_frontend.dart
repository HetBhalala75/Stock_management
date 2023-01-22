import 'dart:io';
import 'package:firstproject/network/pdfdata.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class InvoicePdf{

  // generating the pdf pages
  //*******************************************************
  static Future<File> generate() async {
    final pdf = Document();
    pdf.addPage(
        MultiPage(
      build: (context) => [
         //buildHeader(),
        // SizedBox(height: 3 * PdfPageFormat.cm),
        // buildTitle(),
        // buildInvoice(),
        // Divider(),
        // buildTotal(),
      ],
      // footer: (context) => buildFooter(),
    ));
    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
  //***************************************************************






}