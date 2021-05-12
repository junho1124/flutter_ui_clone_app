import 'package:flutter/material.dart';

class DrawerHead extends StatelessWidget {
  const DrawerHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: DrawerHeader(
        child: Row(
          children: [
            Icon(Icons.vertical_split_outlined,
              size: 30,
              color: Color(0XFFCF233D),),
            SizedBox(width: 8,),
            Text('Jetnews',
              style: TextStyle(
                fontSize: 26,
              ),),
          ],
        ),
      ),
    );
  }
}