// class AppCircleButton extends StatelessWidget {
//   const AppCircleButton(
//       {Key? key, required this.child, this.color, this.onTap, this.width = 60})
//       : super(key: key);
//
//   final Widget child;
//   final Color? color;
//   final double width;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final zoomDrawerController = ZoomDrawerController();
//     return Material(
//       type: MaterialType.transparency,
//       clipBehavior: Clip.hardEdge,
//       shape: const CircleBorder(),
//       child: onTap!=null?InkWell(
//         onTap: (){
//           print("onTap:"+onTap.toString());
//
//           zoomDrawerController.toggle?.call();
//           update();
//           // debugPrint("Taped");
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: child,
//         ),
//       ):InkWell(
//         onTap: (){
//           print("onTap:"+onTap.toString());
//           Get.toNamed("/home");
//           // debugPrint("Taped");
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: child,
//         ),
//       ),
//     );
//   }
// }