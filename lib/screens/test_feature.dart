import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilders extends StatefulWidget {
  @override
  _StreamBuildersState createState() => _StreamBuildersState();
}

bool checkBoxValue = false;
CbStreamBuilder checkbox = CbStreamBuilder();

class _StreamBuildersState extends State<StreamBuilders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Stream Builder",
        style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        ),
          body: StreamBuilder(
        stream: checkbox.cbStream,

        initialData: checkBoxValue,
        builder: (context, snapshot) {
          return Checkbox(
            value: snapshot.data as bool,
            onChanged: (val) async {
              print(snapshot.data as bool);
              print(val);
              checkbox.setValue(val as bool);
            },
          );
        },
      )),
    );
  }
}

class CbStreamBuilder {
  StreamController<bool> cbController = StreamController();

  Sink get cbSink {
    return cbController.sink;
  }

  Stream get cbStream {
    return cbController.stream;
  }

  setValue(bool value) {
    cbSink.add(value);
  }
}
