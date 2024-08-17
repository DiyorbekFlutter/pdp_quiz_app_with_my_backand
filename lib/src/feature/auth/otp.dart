// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class Otp extends StatefulWidget {
//   final String verificationId;
//
//   const Otp(this.verificationId, {super.key});
//
//   @override
//   State<Otp> createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//   final TextEditingController otpController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 const Center(child: SvgIcon(SvgIcons.logo)),
//                 const SizedBox(height: 50),
//                 Form(
//                   key: formKey,
//                   child: Pinput(
//                     validator: (_){
//                       if(_ == null || _.isEmpty) return "SMS kodni kiriting";
//                       if(_.length != 6) return "to'liq kiritilmagan";
//                       return null;
//                     },
//                     length: 6,
//                     controller: otpController,
//                     readOnly: true,
//                     defaultPinTheme: PinTheme(
//                       width: 56,
//                       height: 70,
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         border: Border.all(width: 1, color: const Color(0xffD9D9D9)),
//                         borderRadius: BorderRadius.circular(15)
//                       )
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 SizedBox(
//                   height: 257,
//                   child: GridView.builder(
//                     itemCount: 12,
//                     padding: EdgeInsets.zero,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 15,
//                       mainAxisExtent: 53
//                     ),
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () async {
//                           if(otpController.text.length == 6 && index != 11) return;
//
//                           if(index <= 8){
//                             otpController.text += "${index + 1}";
//                           } else if(index == 10) {
//                             otpController.text += "0";
//                           } else if(index == 9){
//                             context.pop();
//                           } else if(otpController.text.isNotEmpty) {
//                             otpController.text = otpController.text.substring(0, otpController.text.length-1);
//                           }
//
//                           if(otpController.text.length == 6){
//                             if(!formKey.currentState!.validate()) return;
//
//                             await FirebaseAuthService.otp(
//                               context: context,
//                               verificationId: widget.verificationId,
//                               sms: otpController.text,
//                               onChangeIsLoading: (value) => setState(() => isLoading = value)
//                             );
//                           }
//                         },
//                         onLongPress: (){
//                           if(index != 11) return;
//                           otpController.clear();
//                         },
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: const Color(0xffD9D9D9),
//                             borderRadius: BorderRadius.circular(10)
//                           ),
//                           child: index <= 8 || index == 10
//                               ? Text(
//                                   "${index == 10 ? 0 : index+1}",
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     color: Color(0xff264653),
//                                     fontWeight: FontWeight.w500
//                                   ),
//                                 )
//                               : index == 9
//                               ? const SvgIcon(SvgIcons.arrowBack, color: Colors.black, width: 16, height: 16)
//                               : const SvgIcon(SvgIcons.backspace, color: Colors.black),
//                         ),
//                       );
//                     }
//                   ),
//                 ),
//                 const SizedBox(height: 20)
//               ],
//             ),
//           ),
//           if(isLoading)
//             PopScope(
//               canPop: false,
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.3),
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: Center(
//                     child: LoadingAnimationWidget.threeRotatingDots(
//                       color: Colors.blue,
//                       size: 50
//                     ),
//                   ),
//                 ),
//               ),
//             )
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     otpController.dispose();
//     formKey.currentState?.dispose();
//   }
// }
