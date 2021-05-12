import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

class ProgrammingItems extends StatelessWidget {
  ProgrammingItems(this.items);
  List<String> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.asMap().entries.map((e) => MakeProgrammingItems(e)).toList()
    );
  }
}

class MakeProgrammingItems extends StatefulWidget {
  MakeProgrammingItems(this.item);

  MapEntry<int, String> item;

  @override
  _MakeProgrammingItemsState createState() => _MakeProgrammingItemsState();
}

class _MakeProgrammingItemsState extends State<MakeProgrammingItems> {

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
                            icon: context.read<JetNewsProvider>().proChecked.contains(widget.item.key)
                                ? Icon(Icons.check_circle,
                              color: Color(0XFFCF233D),)
                                : Icon(Icons.add_circle_outline_sharp,
                              color: Color(0XFFCF233D),),
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                              if(context.read<JetNewsProvider>().programmingIsPressed) {
                                context.read<JetNewsProvider>().proChecked.add(widget.item.key);
                                context.read<JetNewsProvider>().proPressed();
                              } else {
                                context.read<JetNewsProvider>().proChecked.remove(widget.item.key);
                                context.read<JetNewsProvider>().proPressed();
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