import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

// class User {
//   final String name;
//   final int age;
//
//   const User({required this.name, required this.age});
// }

class PdfApi {
  // static Future<File> generateTable() async {
  //   final pdf = pw.Document();
  //
  //   final headers = ['Name', 'Age'];
  //
  //   final users = [
  //     User(name: 'James', age: 19),
  //     User(name: 'Sarah', age: 21),
  //     User(name: 'Emma', age: 28),
  //   ];
  //   final data = users.map((user) => [user.name, user.age]).toList();
  //
  //   pdf.addPage(pw.Page(build: (context) {
  //     return pw.Container(
  //       margin: pw.EdgeInsets.only(
  //         left: 20,
  //         right: 20,
  //       ),
  //       height: 300,
  //       // width: MediaQuery.of(context).size.width * 1,
  //       // color: Colors.grey,
  //       child: pw.ListView.builder(
  //           itemCount: 2,
  //           itemBuilder: (context, index) {
  //             return pw.Padding(
  //               padding: pw.EdgeInsets.all(8.0),
  //               child: pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   pw.Text("hello "),
  //                   pw.Text("hello"),
  //                   pw.Text("hello"),
  //                   pw.Text("hello"),
  //                 ],
  //               ),
  //             );
  //           }),
  //     );
  //   }));
  //
  //   return saveDocument(name: 'my_example.pdf', pdf: pdf);
  // }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}

// build: (context) => Table.fromTextArray(
//   headers: headers,
//   data: data,
// ),

/*static Future<File> generateImage() async {
    final pdf = Document();

    final imageSvg = await rootBundle.loadString('assets/fruit.svg');
    final imageJpg =
    (await rootBundle.load('assets/person.jpg')).buffer.asUint8List();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 1) {
          return FullPage(
            ignoreMargins: true,
            child: Image(MemoryImage(imageJpg), fit: BoxFit.cover),
          );
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          Container(
            height: pageTheme.pageFormat.availableHeight - 1,
            child: Center(
              child: Text(
                'Foreground Text',
                style: TextStyle(color: PdfColors.white, fontSize: 48),
              ),
            ),
          ),
          SvgImage(svg: imageSvg),
          Image(MemoryImage(imageJpg)),
          Center(
            child: ClipRRect(
              horizontalRadius: 32,
              verticalRadius: 32,
              child: Image(
                MemoryImage(imageJpg),
                width: pageTheme.pageFormat.availableWidth / 2,
              ),
            ),
          ),
          GridView(
            crossAxisCount: 3,
            childAspectRatio: 1,
            children: [
              SvgImage(svg: imageSvg),
              SvgImage(svg: imageSvg),
              SvgImage(svg: imageSvg),
              SvgImage(svg: imageSvg),
              SvgImage(svg: imageSvg),
              SvgImage(svg: imageSvg),
            ],
          )
        ],
      ),
    );

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }
*/
