import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

class TechnologyItems extends StatelessWidget {
  TechnologyItems(this.items);
  List<String> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.asMap().entries.map((e) => MakeTechnologyItems(e)).toList()
    );
  }
}

class MakeTechnologyItems extends StatefulWidget {
  MakeTechnologyItems(this.item);

  MapEntry<int, String> item;

  @override
  _MakeTechnologyItemsState createState() => _MakeTechnologyItemsState();
}

class _MakeTechnologyItemsState extends State<MakeTechnologyItems> {

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
                            icon: context.read<JetNewsProvider>().checked.contains(widget.item.key + 6)
                                ? Icon(Icons.check_circle,
                              color: Color(0XFFCF233D),)
                                : Icon(Icons.add_circle_outline_sharp,
                              color: Color(0XFFCF233D),),
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                              if(context.read<JetNewsProvider>().isPressed) {
                                context.read<JetNewsProvider>().checked.add(widget.item.key + 6);
                                context.read<JetNewsProvider>().pressed();
                              } else {
                                context.read<JetNewsProvider>().checked.remove(widget.item.key + 6);
                                context.read<JetNewsProvider>().pressed();
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