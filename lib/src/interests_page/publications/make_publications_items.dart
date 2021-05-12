import 'package:flutter/material.dart';
import 'package:flutter_ui_clone_app/src/provider/jetnews_provider.dart';
import 'package:provider/provider.dart';

class PublicationsItems extends StatefulWidget {
  @override
  _PublicationsItemsState createState() => _PublicationsItemsState();
}

class _PublicationsItemsState extends State<PublicationsItems> {

  @override
  Widget build(BuildContext context) {

    return Column(
        children: context.read<JetNewsProvider>().publications.asMap().entries.map((e) => MakePublicationsItems(e)).toList()
    );
  }
}

class MakePublicationsItems extends StatefulWidget {
  MakePublicationsItems(this.item);

  MapEntry<int, String> item;

  @override
  _MakePublicationsItemsState createState() => _MakePublicationsItemsState();
}

class _MakePublicationsItemsState extends State<MakePublicationsItems> {

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
                            icon: context.read<JetNewsProvider>().checked.contains(widget.item.key + 30)
                                ? Icon(Icons.check_circle,
                              color: Color(0XFFCF233D),)
                                : Icon(Icons.add_circle_outline_sharp,
                              color: Color(0XFFCF233D),),
                            iconSize: 40,
                            onPressed: () {
                              setState(() {
                                if(context.read<JetNewsProvider>().isPressed) {
                                  context.read<JetNewsProvider>().checked.add(widget.item.key + 30);
                                  context.read<JetNewsProvider>().pressed();
                                } else {
                                  context.read<JetNewsProvider>().checked.remove(widget.item.key + 30);
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