import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfApi {
  // save the document which is genrated by us
  //******************************************************************
  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    // saving the pdf
    final bytes = await pdf.save();
    // taking the directory to save the pdf
    final dir = await getApplicationDocumentsDirectory();
    // fetching the directory path to variable file
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  //*******************************************************************
  //this function open the file
  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  //********************************************************************
  //displaying the cart detail on Pdf
  static Widget buildInvoice() {
    return Table.fromTextArray(
      headers: [
        'Description',
        'Date',
        'Quantity',
        'Unit Price',
        'VAT',
        'Total'
      ],
      data: [],
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }
  //****************************************************************


  static Widget buildTotal() {
    // final netTotal = invoice.items
    //     .map((item) => item.unitPrice * item.quantity)
    //     .reduce((item1, item2) => item1 + item2);
    // final vatPercent = invoice.items.first.vat;
    // final vat = netTotal * vatPercent;
    // final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total',
                  value: "Utils.formatPrice(netTotal),",
                  unite: true,
                ),
                buildText(
                  title: "'Vat  %',",
                  value: "Utils.formatPrice(vat),",
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total amount due',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: "Utils.formatPrice(total)",
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }
  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}