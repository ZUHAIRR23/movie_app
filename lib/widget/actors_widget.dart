import 'package:flutter/cupertino.dart';

class ActorsWidget extends StatelessWidget {
  const ActorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}
