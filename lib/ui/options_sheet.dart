import 'package:flutter/material.dart';

import 'package:tizeno/ui/color_slider.dart';
import 'package:tizeno/data/utility.dart';

enum moreOptions {
  delete,
// archive,
  share,
  copy
}

class MoreOptionsSheet extends StatefulWidget {
  final Color color;
  final DateTime dateLastEdited;
  final void Function(Color) callBackColorTapped;

  final void Function(moreOptions) callBackOptionTapped;

  const MoreOptionsSheet(
      {Key key,
      this.color,
      this.dateLastEdited,
      this.callBackColorTapped,
      this.callBackOptionTapped})
      : super(key: key);

  @override
  _MoreOptionsSheetState createState() => _MoreOptionsSheetState();
}

class _MoreOptionsSheetState extends State<MoreOptionsSheet> {
  var noteColor;

  @override
  void initState() {
    noteColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.noteColor,
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.delete),
              title: new Text('Delete permanently'),
              onTap: () {
                Navigator.of(context).pop();
                widget.callBackOptionTapped(moreOptions.delete);
              }),
          // new ListTile(
          //     leading: new Icon(Icons.archive),
          //     title: new Text('Archive'),
          //     onTap: () {
          //       Navigator.of(context).pop();
          //       widget.callBackOptionTapped(moreOptions.archive);
          //     }),
          new ListTile(
              leading: new Icon(Icons.content_copy),
              title: new Text('Duplicate'),
              onTap: () {
                Navigator.of(context).pop();
                widget.callBackOptionTapped(moreOptions.copy);
              }),
          new ListTile(
              leading: new Icon(Icons.share),
              title: new Text('Share'),
              onTap: () {
                Navigator.of(context).pop();
                widget.callBackOptionTapped(moreOptions.share);
              }),
          new Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SizedBox(
              height: 44,
              width: MediaQuery.of(context).size.width,
              child: ColorSlider(
                callBackColorTapped: _changeColor,
                // call callBack from notePage here
                noteColor: noteColor, // take color from local variable
              ),
            ),
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 44,
                child: Center(
                    child: Text("Edited " +
                        CentralStation.stringForDatetime(
                            widget.dateLastEdited))),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          // new ListTile()
        ],
      ),
    );
  }

  void _changeColor(Color color) {
    setState(() {
      this.noteColor = color;
      widget.callBackColorTapped(color);
    });
  }
}
