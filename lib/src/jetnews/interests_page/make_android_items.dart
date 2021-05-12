import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

class AndroidItems extends StatelessWidget {
  AndroidItems(this.items);
  List<String> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.asMap().entries.map((e) => MakeAndroidItems(e)).toList()
    );
  }
}

class MakeAndroidItems extends StatefulWidget {
  MakeAndroidItems(this.item);

  MapEntry<int, String> item;

  @override
  _MakeAndroidItemsState createState() => _MakeAndroidItemsState();
}

class _MakeAndroidItemsState extends State<MakeAndroidItems> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.account_box_sharp,
                size: 80,
                color: Color(0XFFDCDCDE),),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 16.0,),
                        Expanded(
                            flex: 5,
                            child: Text(widget.item.value,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),)),
                        IconButton(
                            icon: context.read<JetNewsProvider>().andChecked.contains(widget.item.key)
                                ? Icon(Icons.check_circle,
                              color: Color(0XFFCF233D),)
                                : Icon(Icons.add_circle_outline_sharp,
                              color: Color(0XFFCF233D),),
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                              if(context.read<JetNewsProvider>().androidIsPressed) {
                                context.read<JetNewsProvider>().andChecked.add(widget.item.key);
                                context.read<JetNewsProvider>().andPressed();
                              } else {
                                context.read<JetNewsProvider>().andChecked.remove(widget.item.key);
                                context.read<JetNewsProvider>().andPressed();
                              }
                              });
                            }
                            )
                      ],
                    ),
                    Divider(color: Colors.grey,height: 1,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}