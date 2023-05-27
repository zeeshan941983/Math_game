// //////////////////////
// class custom_container extends StatelessWidget {
//   final ontap;
//   String text;

//   custom_container({
//     Key? key,
//     required this.ontap,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.grey[300],
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';

/////////////////local
class space_box extends StatelessWidget {
  const space_box({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }
}
