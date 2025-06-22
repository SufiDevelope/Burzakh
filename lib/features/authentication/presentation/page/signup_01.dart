//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:io';
//
// class Signup01 extends StatefulWidget {
//   const Signup01({Key? key}) : super(key: key);
//
//   @override
//   State<Signup01> createState() => _Signup01State();
// }
//
// class _Signup01State extends State<Signup01>
//     with TickerProviderStateMixin {
//   // Form controllers
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   // Form state
//   final Map<String, String> errors = {};
//   final Map<String, bool> touched = {};
//   bool showPassword = false;
//   bool isSubmitting = false;
//   bool agreedToTerms = false;
//   int passwordStrength = 0;
//   bool isRTL = false;
//
//   File? passportFile;
//   File? marsoomFile;
//
//   // Animation controllers
//   late AnimationController fadeController;
//   late AnimationController pulseController;
//   late AnimationController subtleController;
//
//   // Animations
//   late Animation<double> fadeAnimation;
//   late Animation<double> pulseAnimation;
//   late Animation<double> subtleAnimation;
//
//   // Color palette
//   final Map<String, Color> colors = {
//     'background1': const Color(0xFFFBF7F2),
//     'background2': const Color(0xFFF2EDE6),
//     'cardBg': const Color(0xF2FFFDF),
//     'primary': const Color(0xFF053B30),
//     'primaryLight': const Color(0xFF0D4E40),
//     'secondary': const Color(0xFFAD8442),
//     'secondaryLight': const Color(0xFFD9C9A8),
//     'text': const Color(0xFF1A1914),
//     'subtleText': const Color(0xFF5F5A51),
//     'placeholder': const Color(0xFFA9A49E),
//     'success': const Color(0xFF3B8A5C),
//     'error': const Color(0xFFC75050),
//     'errorLight': const Color(0xFFFFF5F5),
//     'successLight': const Color(0xFFF0FFF4),
//   };
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize animation controllers
//     fadeController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//
//     pulseController = AnimationController(
//       duration: const Duration(seconds: 8),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     subtleController = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     // Initialize animations
//     fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: fadeController, curve: Curves.easeOut),
//     );
//
//     pulseAnimation = Tween<double>(begin: 0.15, end: 0.25).animate(
//       CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
//     );
//
//     subtleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
//       CurvedAnimation(parent: subtleController, curve: Curves.easeInOut),
//     );
//
//     // Start animations
//     fadeController.forward();
//
//     // Add listeners for password strength
//     passwordController.addListener(() {
//       setState(() {
//         passwordStrength = calculatePasswordStrength(passwordController.text);
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     firstNameController.dispose();
//     lastNameController.dispose();
//     passwordController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     fadeController.dispose();
//     pulseController.dispose();
//     subtleController.dispose();
//     super.dispose();
//   }
//
//   int calculatePasswordStrength(String password) {
//     int strength = 0;
//     if (password.length >= 8) strength += 25;
//     if (RegExp(r'[A-Z]').hasMatch(password)) strength += 25;
//     if (RegExp(r'[0-9]').hasMatch(password)) strength += 25;
//     if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) strength += 25;
//     return strength;
//   }
//
//   String? validateField(String field, String value) {
//     switch (field) {
//       case 'firstName':
//       case 'lastName':
//         return value.trim().isEmpty ? 'This field is required' : null;
//       case 'email':
//         final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
//         return !emailRegex.hasMatch(value) ? 'Please enter a valid email' : null;
//       case 'phone':
//         final phoneRegex = RegExp(r'^[+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
//         return !phoneRegex.hasMatch(value) ? 'Please enter a valid phone number' : null;
//       case 'password':
//         if (value.length < 8) return 'Password must be at least 8 characters';
//         if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Password must contain at least one uppercase letter';
//         if (!RegExp(r'[0-9]').hasMatch(value)) return 'Password must contain at least one number';
//         return null;
//       case 'passport':
//         return passportFile == null ? 'Passport document is required' : null;
//       default:
//         return null;
//     }
//   }
//
//   void handleSubmit() async {
//     // Validate all fields
//     final Map<String, String> newErrors = {};
//
//     final firstNameError = validateField('firstName', firstNameController.text);
//     if (firstNameError != null) newErrors['firstName'] = firstNameError;
//
//     final lastNameError = validateField('lastName', lastNameController.text);
//     if (lastNameError != null) newErrors['lastName'] = lastNameError;
//
//     final passwordError = validateField('password', passwordController.text);
//     if (passwordError != null) newErrors['password'] = passwordError;
//
//     final phoneError = validateField('phone', phoneController.text);
//     if (phoneError != null) newErrors['phone'] = phoneError;
//
//     final emailError = validateField('email', emailController.text);
//     if (emailError != null) newErrors['email'] = emailError;
//
//     final passportError = validateField('passport', '');
//     if (passportError != null) newErrors['passport'] = passportError;
//
//     if (!agreedToTerms) {
//       newErrors['terms'] = 'You must agree to the terms and conditions';
//     }
//
//     setState(() {
//       errors.clear();
//       errors.addAll(newErrors);
//       touched.addAll({
//         'firstName': true,
//         'lastName': true,
//         'password': true,
//         'phone': true,
//         'email': true,
//         'passport': true,
//       });
//     });
//
//     if (newErrors.isEmpty) {
//       setState(() {
//         isSubmitting = true;
//       });
//
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       setState(() {
//         isSubmitting = false;
//       });
//
//       // Handle success
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Account created successfully!')),
//         );
//       }
//     }
//   }
//
//   Widget buildStatusBar() {
//     return Container(
//       color: Colors.black,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text(
//             '9:41',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           Row(
//             children: [
//               Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 16),
//               const SizedBox(width: 4),
//               Icon(Icons.wifi, color: Colors.white, size: 16),
//               const SizedBox(width: 4),
//               Icon(Icons.battery_full, color: Colors.white, size: 16),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildLogo() {
//     return AnimatedBuilder(
//       animation: fadeAnimation,
//       builder: (context, child) {
//         return FadeTransition(
//           opacity: fadeAnimation,
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Pulse animation background
//                   AnimatedBuilder(
//                     animation: pulseAnimation,
//                     builder: (context, child) {
//                       return Container(
//                         width: 128,
//                         height: 128,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           gradient: RadialGradient(
//                             colors: [
//                               colors['secondary']!.withOpacity(pulseAnimation.value),
//                               Colors.transparent,
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   // Logo container
//                   AnimatedBuilder(
//                     animation: subtleAnimation,
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: subtleAnimation.value,
//                         child: Container(
//                           width: 96,
//                           height: 96,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                             gradient: LinearGradient(
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                               colors: [
//                                 Colors.white.withOpacity(0.12),
//                                 Colors.white.withOpacity(0.03),
//                               ],
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.08),
//                                 blurRadius: 40,
//                                 offset: const Offset(0, 12),
//                               ),
//                               BoxShadow(
//                                 color: Colors.white.withOpacity(0.1),
//                                 blurRadius: 0,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: CustomPaint(
//                               size: const Size(70, 70),
//                               painter: LogoPainter(colors: colors),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'برزخ',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500,
//                   color: colors['text'],
//                   letterSpacing: 0.5,
//                 ),
//                 textDirection: TextDirection.rtl,
//               ),
//               Text(
//                 'BURZAKH',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: colors['text'],
//                   letterSpacing: 4,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget buildProgressIndicator() {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Account Setup',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: colors['subtleText'],
//               ),
//             ),
//             Text(
//               'Step 1 of 1',
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: colors['secondary'],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(2),
//           child: LinearProgressIndicator(
//             value: 1.0,
//             backgroundColor: colors['secondary']!.withOpacity(0.12),
//             valueColor: AlwaysStoppedAnimation<Color>(colors['secondary']!),
//             minHeight: 4,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildTextField({
//     required String placeholder,
//     required TextEditingController controller,
//     required String field,
//     bool isPassword = false,
//     TextInputType keyboardType = TextInputType.text,
//     bool isFile = false,
//     File? file,
//     Function(File)? onFileSelected,
//   }) {
//     final error = errors[field];
//     final isTouched = touched[field] ?? false;
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: file != null ? colors['successLight'] : colors['cardBg'],
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.03),
//                   blurRadius: 10,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//               border: Border.all(
//                 color: error != null && isTouched
//                     ? colors['error']!
//                     : colors['secondary']!.withOpacity(0.12),
//                 width: 1,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     obscureText: isPassword && !showPassword,
//                     keyboardType: keyboardType,
//                     textDirection: isRTL && !isFile ? TextDirection.rtl : TextDirection.ltr,
//                     style: TextStyle(
//                       color: colors['text'],
//                       fontSize: 16,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     decoration: InputDecoration(
//                       hintText: placeholder,
//                       hintStyle: TextStyle(
//                         color: colors['placeholder'],
//                         fontSize: 16,
//                         fontWeight: FontWeight.w300,
//                       ),
//                       border: InputBorder.none,
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 16,
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         touched[field] = true;
//                         errors[field] = validateField(field, value) ?? '';
//                       });
//                     },
//                     readOnly: isFile,
//                   ),
//                 ),
//                 if (isPassword)
//                   IconButton(
//                     icon: Icon(
//                       showPassword ? Icons.visibility_off : Icons.visibility,
//                       color: colors['secondary'],
//                       size: 18,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         showPassword = !showPassword;
//                       });
//                     },
//                   ),
//                 if (isFile)
//                   IconButton(
//                     icon: Icon(
//                       file != null ? Icons.check : Icons.upload,
//                       color: file != null ? colors['success'] : colors['secondary'],
//                       size: 18,
//                     ),
//                     onPressed: () async {
//                       // Simulate file picker
//                       // In real app, use file_picker package
//                       setState(() {
//                         if (field == 'passport') {
//                           passportFile = File('passport.pdf');
//                         } else if (field == 'marsoom') {
//                           marsoomFile = File('marsoom.pdf');
//                         }
//                       });
//                     },
//                   ),
//               ],
//             ),
//           ),
//           if (field == 'password' && controller.text.isNotEmpty)
//             Column(
//               children: [
//                 const SizedBox(height: 8),
//                 Row(
//                   children: List.generate(4, (index) {
//                     final level = (index + 1) * 25;
//                     return Expanded(
//                       child: Container(
//                         margin: EdgeInsets.only(left: index < 3 ? 4 : 0),
//                         height: 4,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(2),
//                           color: passwordStrength >= level
//                               ? passwordStrength >= 75
//                               ? colors['success']
//                               : passwordStrength >= 50
//                               ? const Color(0xFFC77C3D)
//                               : colors['error']
//                               : colors['secondary']!.withOpacity(0.12),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   passwordStrength >= 75
//                       ? 'Strong password'
//                       : passwordStrength >= 50
//                       ? 'Moderate password'
//                       : passwordStrength >= 25
//                       ? 'Weak password'
//                       : 'Very weak password',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: colors['subtleText'],
//                   ),
//                 ),
//               ],
//             ),
//           if (error != null && error.isNotEmpty && isTouched)
//             Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 12,
//                     color: colors['error'],
//                   ),
//                   const SizedBox(width: 4),
//                   Expanded(
//                     child: Text(
//                       error,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: colors['error'],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           if (isFile && file != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 4),
//               child: Text(
//                 '${file.path.split('/').last} uploaded successfully',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: colors['success'],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [colors['background1']!, colors['background2']!],
//           ),
//         ),
//         child: Column(
//           children: [
//             buildStatusBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 80),
//                       // Language toggle
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Transform.translate(
//                           offset: const Offset(0, -60),
//                           child: TextButton(
//                             onPressed: () {
//                               setState(() {
//                                 isRTL = !isRTL;
//                               });
//                             },
//                             style: TextButton.styleFrom(
//                               backgroundColor: colors['secondary']!.withOpacity(0.1),
//                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             child: Text(
//                               isRTL ? 'EN' : 'عربي',
//                               style: TextStyle(
//                                 color: colors['secondary'],
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       buildLogo(),
//                       const SizedBox(height: 32),
//                       Text(
//                         'Create an account',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w300,
//                           color: colors['text'],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       buildProgressIndicator(),
//                       const SizedBox(height: 24),
//                       buildTextField(
//                         placeholder: 'First Name *',
//                         controller: firstNameController,
//                         field: 'firstName',
//                       ),
//                       buildTextField(
//                         placeholder: 'Last Name *',
//                         controller: lastNameController,
//                         field: 'lastName',
//                       ),
//                       buildTextField(
//                         placeholder: 'Password *',
//                         controller: passwordController,
//                         field: 'password',
//                         isPassword: true,
//                       ),
//                       buildTextField(
//                         placeholder: 'Phone Number *',
//                         controller: phoneController,
//                         field: 'phone',
//                         keyboardType: TextInputType.phone,
//                       ),
//                       buildTextField(
//                         placeholder: 'Email address *',
//                         controller: emailController,
//                         field: 'email',
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       // Documents divider
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 1,
//                               color: colors['secondary']!.withOpacity(0.15),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.description_outlined,
//                                   size: 16,
//                                   color: colors['secondary'],
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Text(
//                                   'DOCUMENTS',
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: colors['secondary'],
//                                     letterSpacing: 1.5,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               height: 1,
//                               color: colors['secondary']!.withOpacity(0.15),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 24),
//                       buildTextField(
//                         placeholder: 'Passport copy *',
//                         controller: TextEditingController(
//                           text: passportFile?.path.split('/').last ?? '',
//                         ),
//                         field: 'passport',
//                         isFile: true,
//                         file: passportFile,
//                       ),
//                       buildTextField(
//                         placeholder: 'Marsoom (Optional)',
//                         controller: TextEditingController(
//                           text: marsoomFile?.path.split('/').last ?? '',
//                         ),
//                         field: 'marsoom',
//                         isFile: true,
//                         file: marsoomFile,
//                       ),
//                       // Terms and conditions
//                       Container(
//                         margin: const EdgeInsets.only(bottom: 24),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Checkbox(
//                               value: agreedToTerms,
//                               onChanged: (value) {
//                                 setState(() {
//                                   agreedToTerms = value ?? false;
//                                 });
//                               },
//                               activeColor: colors['secondary'],
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 12),
//                                 child: Text.rich(
//                                   TextSpan(
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: colors['subtleText'],
//                                     ),
//                                     children: [
//                                       const TextSpan(text: 'I agree to the '),
//                                       TextSpan(
//                                         text: 'Terms and Conditions',
//                                         style: TextStyle(
//                                           color: colors['secondary'],
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                       const TextSpan(text: ' and '),
//                                       TextSpan(
//                                         text: 'Privacy Policy',
//                                         style: TextStyle(
//                                           color: colors['secondary'],
//                                           decoration: TextDecoration.underline,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (errors['terms'] != null)
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 16),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.error_outline,
//                                 size: 12,
//                                 color: colors['error'],
//                               ),
//                               const SizedBox(width: 4),
//                               Text(
//                                 errors['terms']!,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: colors['error'],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       // Sign up button
//                       Container(
//                         width: double.infinity,
//                         height: 54,
//                         margin: const EdgeInsets.only(bottom: 16),
//                         child: ElevatedButton(
//                           onPressed: isSubmitting ? null : handleSubmit,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: colors['primary'],
//                             foregroundColor: Colors.white,
//                             disabledBackgroundColor: colors['primary']!.withOpacity(0.75),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: isSubmitting
//                               ? Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Creating Account...',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   letterSpacing: 1,
//                                 ),
//                               ),
//                             ],
//                           )
//                               : const Text(
//                             'SIGN UP',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.5,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Login link
//                       TextButton(
//                         onPressed: () {
//                           // Navigate to login
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Already have an account? ',
//                               style: TextStyle(
//                                 color: colors['secondary'],
//                                 fontSize: 14,
//                               ),
//                             ),
//                             Text(
//                               'Login',
//                               style: TextStyle(
//                                 color: colors['secondary'],
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             Icon(
//                               Icons.chevron_right,
//                               color: colors['secondary'],
//                               size: 16,
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Version info
//                       Padding(
//                         padding: const EdgeInsets.only(top: 32, bottom: 24),
//                         child: Text(
//                           'Version 1.0.0',
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: colors['placeholder'],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // iPhone home indicator
//             Container(
//               margin: const EdgeInsets.only(bottom: 8),
//               width: 134,
//               height: 5,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: Colors.black.withOpacity(0.2),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Custom painter for the logo
// class LogoPainter extends CustomPainter {
//   final Map<String, Color> colors;
//
//   LogoPainter({required this.colors});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1.5
//       ..color = colors['text']!;
//
//     final fillPaint = Paint()
//       ..style = PaintingStyle.fill
//       ..color = colors['secondary']!.withOpacity(0.3);
//
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//
//     // Draw outer triangle
//     final outerPath = Path()
//       ..moveTo(centerX, size.height * 0.1)
//       ..lineTo(size.width * 0.15, size.height * 0.65)
//       ..lineTo(size.width * 0.35, size.height * 0.6)
//       ..lineTo(centerX, size.height * 0.1)
//       ..close();
//
//     canvas.drawPath(outerPath, paint);
//
//     final outerPath2 = Path()
//       ..moveTo(centerX, size.height * 0.1)
//       ..lineTo(size.width * 0.85, size.height * 0.65)
//       ..lineTo(size.width * 0.65, size.height * 0.6)
//       ..lineTo(centerX, size.height * 0.1)
//       ..close();
//
//     canvas.drawPath(outerPath2, paint);
//
//     // Draw inner triangle
//     final innerPath = Path()
//       ..moveTo(centerX, size.height * 0.3)
//       ..lineTo(size.width * 0.35, size.height * 0.55)
//       ..lineTo(size.width * 0.65, size.height * 0.55)
//       ..close();
//
//     canvas.drawPath(innerPath, fillPaint);
//     canvas.drawPath(innerPath, paint);
//
//     // Draw dots
//     final dotPaint = Paint()
//       ..style = PaintingStyle.fill
//       ..color = colors['secondary']!;
//
//     canvas.drawCircle(
//       Offset(centerX, size.height * 0.7),
//       3,
//       dotPaint,
//     );
//
//     final dotPaint2 = Paint()
//       ..style = PaintingStyle.fill
//       ..color = colors['text']!.withOpacity(0.5);
//
//     canvas.drawCircle(
//       Offset(centerX, size.height * 0.8),
//       2,
//       dotPaint2,
//     );
//
//     final dotPaint3 = Paint()
//       ..style = PaintingStyle.fill
//       ..color = colors['text']!.withOpacity(0.3);
//
//     canvas.drawCircle(
//       Offset(centerX, size.height * 0.87),
//       1.5,
//       dotPaint3,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
