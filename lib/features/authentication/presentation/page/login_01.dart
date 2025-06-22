import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:burzakh/core/theme/AppColor.dart';
import 'package:burzakh/features/authentication/presentation/page/forgot_possword.dart';
import 'package:burzakh/features/authentication/presentation/page/login_with_uae.dart';
import 'package:burzakh/features/authentication/presentation/page/sign_up.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

import '../../../../constants/app_assets.dart';
import '../../../../constants/app_widgets_size.dart';
import '../../../../core/app/di_container.dart';
import '../controller/cubit.dart';
import 'login_with_uae_01.dart';

class BurzakhEnhancedLogin extends StatefulWidget {
  const BurzakhEnhancedLogin({Key? key}) : super(key: key);

  @override
  State<BurzakhEnhancedLogin> createState() => _BurzakhEnhancedLoginState();
}

class _BurzakhEnhancedLoginState extends State<BurzakhEnhancedLogin>
    with SingleTickerProviderStateMixin {
  bool _showPassword = false;
  bool _rememberMe = false;
  String _email = '';
  String _password = '';
  String _emailError = '';
  String _passwordError = '';
  int _passwordStrength = 0;
  bool _isLoading = false;
  String? _hoveredButton;
  String? _focusedField;

  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _pulseAnimation;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Color Scheme
  static const Color primaryEmerald = Color(0xFF053B30);
  static const Color primaryGradientStart = Color(0xFF0D4E40);
  static const Color richGold = Color(0xFFAD8442);
  static const Color lightGoldAccent = Color(0xFFD9C9A8);
  static const Color mainText = Color(0xFF1A1914);
  static const Color subtleText = Color(0xFF5F5A51);
  static const Color placeholderText = Color(0xFFA9A49E);
  static const Color backgroundStart = Color(0xFFFBF7F2);
  static const Color backgroundEnd = Color(0xFFF2EDE6);
  static const Color cardBackground = Color(0xFFFFFDFA);
  static const Color success = Color(0xFF3B8A5C);
  static const Color successLight = Color(0xFFF0FFF4);
  static const Color error = Color(0xFFC75050);
  static const Color errorLight = Color(0xFFFFF5F5);
  static final Color defaultBorder = richGold.withOpacity(0.12);
  static final Color focusBorder = richGold.withOpacity(0.4);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.repeat(reverse: true);
    _animationController.forward();

    _emailFocusNode.addListener(() {
      setState(() {
        _focusedField = _emailFocusNode.hasFocus ? 'email' : null;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _focusedField = _passwordFocusNode.hasFocus ? 'password' : null;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  String validateEmail(String email) {
    final re = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (email.isEmpty) return 'Email is required';
    if (!re.hasMatch(email)) return 'Please enter a valid email';
    return '';
  }

  int checkPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 6) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) strength++;
    return strength;
  }

  void handleEmailChange(String value) {
    setState(() {
      _email = value;
      if (_emailError.isNotEmpty) _emailError = validateEmail(value);
    });
  }

  void handlePasswordChange(String value) {
    setState(() {
      _password = value;
      _passwordStrength = checkPasswordStrength(value);
      if (_passwordError.isNotEmpty && value.length >= 6) _passwordError = '';
    });
  }

  void handleSubmit(BuildContext context) async {
    final emailErr = validateEmail(_email);
    final passErr =
        _password.length < 8 ? 'Password must be at least 8 characters' : '';

    setState(() {
      _emailError = emailErr;
      _passwordError = passErr;
    });

    if (emailErr.isEmpty && passErr.isEmpty) {
      setState(() {
        _isLoading = true;
      });

      await authCubit.login(email: _email, password: _password, context: context);
    }
  }

  Color getPasswordStrengthColor() {
    switch (_passwordStrength) {
      case 0:
      case 1:
        return error;
      case 2:
      case 3:
        return richGold;
      case 4:
        return success;
      default:
        return error;
    }
  }

  String getPasswordStrengthText() {
    switch (_passwordStrength) {
      case 0:
        return 'Very Weak';
      case 1:
        return 'Weak';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Strong';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.bgGradient),
        child: Stack(
          children: [
            // Floating gradient orbs
            // Positioned(
            //   top: 80,
            //   right: 80,
            //   child: Container(
            //     width: 384,
            //     height: 384,
            //     decoration: BoxDecoration(
            //       gradient: const LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [primaryGradientStart, primaryEmerald],
            //       ),
            //       borderRadius: BorderRadius.circular(192),
            //     ),
            //     child: BackdropFilter(
            //       filter: ui.ImageFilter.blur(sigmaX: 128, sigmaY: 128),
            //       child: Container(color: Colors.transparent),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 80,
              left: 80,
              child: Container(
                width: context.mw * 0.3,
                height: context.mw * 0.3,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [richGold.withOpacity(0.1), Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(192),
                ),
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 128, sigmaY: 128),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),

            // Main content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo and title with animation
                        FadeTransition(
                          opacity: _fadeInAnimation,
                          child: Column(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return Transform.scale(
                                      scale: 1.0 +
                                          (_animationController.value * 0.05),
                                      child: Image.asset(
                                        AppAssets.appLogo,
                                        width: logoWidthBoarding,
                                        height: logoHeightBoarding,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // const SizedBox(height: 12),
                              // MouseRegion(
                              //   cursor: SystemMouseCursors.click,
                              //   child: AnimatedBuilder(
                              //     animation: _animationController,
                              //     builder: (context, child) {
                              //       return Transform.scale(
                              //         scale: 1.0 + (_animationController.value * 0.05),
                              //         child: const Text(
                              //           'BURZAKH',
                              //           style: TextStyle(
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.w500,
                              //             color: mainText,
                              //             letterSpacing: 3,
                              //             shadows: [
                              //               Shadow(
                              //                 offset: Offset(0, 2),
                              //                 blurRadius: 8,
                              //                 color: Colors.black12,
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              0.03.ph(context),
                              AnimatedBuilder(
                                animation: _pulseAnimation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _pulseAnimation.value,
                                    child: Text(
                                      'Please log in to continue'.tr(),
                                      style: TextStyle(
                                        fontSize: context.mh * 0.013,
                                        color: subtleText,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        0.01.ph(context),

                        // Form Card
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                cardBackground.withOpacity(0.98),
                                cardBackground.withOpacity(0.92),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: defaultBorder),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 20),
                                blurRadius: 40,
                                color: primaryEmerald.withOpacity(0.08),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Stack(
                              children: [
                                // Decorative accent line
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 4,
                                    color: richGold,
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 32.0, horizontal: 16),
                                  child: Column(
                                    children: [
                                      // Email Field
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Phone Number or Email'.tr(),
                                                style: TextStyle(
                                                  fontSize: context.mh * 0.015,
                                                  fontWeight: FontWeight.w500,
                                                  color: subtleText,
                                                ),
                                              ),
                                              if (_email.isNotEmpty &&
                                                  _emailError.isEmpty)
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0),
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    size: context.mh * 0.013,
                                                    color: success,
                                                  ),
                                                ),
                                            ],
                                          ),
                                          0.008.ph(context),
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            decoration: BoxDecoration(
                                              boxShadow: _focusedField ==
                                                      'email'
                                                  ? [
                                                      BoxShadow(
                                                        offset:
                                                            const Offset(0, 4),
                                                        blurRadius: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                      ),
                                                    ]
                                                  : [],
                                            ),
                                            child: TextField(
                                              controller: _emailController,
                                              focusNode: _emailFocusNode,
                                              onChanged: handleEmailChange,
                                              style: TextStyle(
                                                fontSize: context.mh * 0.015,
                                                fontWeight: FontWeight.w300,
                                                color: mainText,
                                              ),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter your phone number or email'
                                                        .tr(),
                                                hintStyle: TextStyle(
                                                  fontSize: context.mh * 0.015,
                                                  fontWeight: FontWeight.w300,
                                                  color: placeholderText,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    _emailError.isNotEmpty
                                                        ? errorLight
                                                        : Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color:
                                                        _emailError.isNotEmpty
                                                            ? error
                                                            : defaultBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color:
                                                        _emailError.isNotEmpty
                                                            ? error
                                                            : defaultBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color:
                                                        _emailError.isNotEmpty
                                                            ? error
                                                            : focusBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                suffixIcon:
                                                    _emailError.isNotEmpty
                                                        ? const Icon(
                                                            Icons.error_outline,
                                                            color: error,
                                                          )
                                                        : null,
                                              ),
                                            ),
                                          ),
                                          if (_emailError.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.error_outline,
                                                    size: 12,
                                                    color: error,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    _emailError.tr(),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: error,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                      0.01.ph(context),

                                      // Password Field
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Password'.tr(),
                                            style: TextStyle(
                                              fontSize: context.mh * 0.015,
                                              fontWeight: FontWeight.w500,
                                              color: subtleText,
                                            ),
                                          ),
                                          0.008.ph(context),
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            decoration: BoxDecoration(
                                              boxShadow: _focusedField ==
                                                      'password'
                                                  ? [
                                                      BoxShadow(
                                                        offset:
                                                            const Offset(0, 4),
                                                        blurRadius: 8,
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                      ),
                                                    ]
                                                  : [],
                                            ),
                                            child: TextField(
                                              controller: _passwordController,
                                              focusNode: _passwordFocusNode,
                                              onChanged: handlePasswordChange,
                                              obscureText: !_showPassword,
                                              style:  TextStyle(
                                                fontSize: context.mh * 0.015,
                                                fontWeight: FontWeight.w300,
                                                color: mainText,
                                              ),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter your password'.tr(),
                                                hintStyle:  TextStyle(
                                                  fontSize: context.mh * 0.015,
                                                  fontWeight: FontWeight.w300,
                                                  color: placeholderText,
                                                ),
                                                filled: true,
                                                fillColor:
                                                    _passwordError.isNotEmpty
                                                        ? errorLight
                                                        : Colors.white,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 14,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: _passwordError
                                                            .isNotEmpty
                                                        ? error
                                                        : defaultBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: _passwordError
                                                            .isNotEmpty
                                                        ? error
                                                        : defaultBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  borderSide: BorderSide(
                                                    color: _passwordError
                                                            .isNotEmpty
                                                        ? error
                                                        : focusBorder,
                                                    width: 2,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _showPassword
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: subtleText,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _showPassword =
                                                          !_showPassword;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Password strength indicator
                                          // if (_password.isNotEmpty)
                                          //   Padding(
                                          //     padding: const EdgeInsets.only(
                                          //         top: 12.0),
                                          //     child: Column(
                                          //       crossAxisAlignment:
                                          //           CrossAxisAlignment.start,
                                          //       children: [
                                          //         Row(
                                          //           children: List.generate(4,
                                          //               (index) {
                                          //             return Expanded(
                                          //               child: Container(
                                          //                 margin:
                                          //                     const EdgeInsets
                                          //                         .only(
                                          //                         right: 4),
                                          //                 height: 4,
                                          //                 decoration:
                                          //                     BoxDecoration(
                                          //                   color: index <
                                          //                           _passwordStrength
                                          //                       ? getPasswordStrengthColor()
                                          //                       : defaultBorder,
                                          //                   borderRadius:
                                          //                       BorderRadius
                                          //                           .circular(
                                          //                               2),
                                          //                 ),
                                          //               ),
                                          //             );
                                          //           }),
                                          //         ),
                                          //         const SizedBox(height: 4),
                                          //         Text(
                                          //           getPasswordStrengthText()
                                          //               .tr(),
                                          //           style: TextStyle(
                                          //             fontSize: 12,
                                          //             color:
                                          //                 getPasswordStrengthColor(),
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),

                                          // if (_passwordError.isNotEmpty)
                                          //   Padding(
                                          //     padding: const EdgeInsets.only(
                                          //         top: 8.0),
                                          //     child: Row(
                                          //       children: [
                                          //         const Icon(
                                          //           Icons.error_outline,
                                          //           size: 12,
                                          //           color: error,
                                          //         ),
                                          //         const SizedBox(width: 4),
                                          //         Text(
                                          //           _passwordError.tr(),
                                          //           style: const TextStyle(
                                          //             fontSize: 12,
                                          //             color: error,
                                          //           ),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                      0.015.ph(context),

                                      // Remember Me & Forgot Password
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _rememberMe = !_rememberMe;
                                                  });
                                                },
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    gradient: _rememberMe
                                                        ? const LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              primaryGradientStart,
                                                              primaryEmerald,
                                                            ],
                                                          )
                                                        : null,
                                                    color: _rememberMe
                                                        ? null
                                                        : Colors.white,
                                                    border: Border.all(
                                                      color: richGold
                                                          .withOpacity(0.3),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: _rememberMe
                                                      ? const Icon(
                                                          Icons.check,
                                                          size: 14,
                                                          color: Colors.white,
                                                        )
                                                      : null,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                'Remember Me'.tr(),
                                                style: TextStyle(
                                                  fontSize: context.mh * 0.014,
                                                  color: subtleText,
                                                ),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgetPasswordScreen(),
                                                  ));
                                            },
                                            child: Text(
                                              'Recover Password'.tr(),
                                              style: TextStyle(
                                                fontSize: context.mh * 0.014,
                                                fontWeight: FontWeight.w500,
                                                color: richGold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      0.015.ph(context),

                                      // Login Button
                                      MouseRegion(
                                        onEnter: (_) => setState(
                                            () => _hoveredButton = 'login'),
                                        onExit: (_) => setState(
                                            () => _hoveredButton = null),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          transform: Matrix4.identity()
                                            ..scale(_hoveredButton == 'login'
                                                ? 1.02
                                                : 1.0),
                                          decoration: BoxDecoration(
                                            color: AppColor.buttonColor,
                                            // gradient: const LinearGradient(
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            //   colors: [primaryGradientStart, primaryEmerald],
                                            // ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 4),
                                                blurRadius:
                                                    _hoveredButton == 'login'
                                                        ? 20
                                                        : 10,
                                                color: primaryEmerald
                                                    .withOpacity(0.15),
                                              ),
                                            ],
                                          ),
                                          child: BlocBuilder(
                                              bloc: authCubit,
                                              builder: (_, state) {
                                                return ElevatedButton(
                                                  onPressed:
                                                      authCubit.isLoginLoading
                                                          ? null
                                                          : () => handleSubmit(context),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                    minimumSize: const Size(
                                                        double.infinity, 48),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                                  child: authCubit
                                                          .isLoginLoading
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                strokeWidth: 2,
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  Colors.white,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 8),
                                                            Text(
                                                              'Logging in...'
                                                                  .tr(),
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1.5,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Text(
                                                          'LOGIN'.tr(),
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.white,
                                                            letterSpacing: 1.5,
                                                          ),
                                                        ),
                                                );
                                              }),
                                        ),
                                      ),
                                      0.02.ph(context),

                                      // Divider
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: richGold.withOpacity(0.2),
                                              thickness: 1,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text(
                                              'or'.tr(),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: subtleText,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: richGold.withOpacity(0.2),
                                              thickness: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      0.02.ph(context),

                                      // UAE PASS Login
                                      MouseRegion(
                                        onEnter: (_) => setState(
                                            () => _hoveredButton = 'uaepass'),
                                        onExit: (_) => setState(
                                            () => _hoveredButton = null),
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          transform: Matrix4.identity()
                                            ..scale(_hoveredButton == 'uaepass'
                                                ? 1.02
                                                : 1.0),
                                          decoration: BoxDecoration(
                                            color: _hoveredButton == 'uaepass'
                                                ? successLight
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: richGold.withOpacity(0.2),
                                            ),
                                            boxShadow: _hoveredButton ==
                                                    'uaepass'
                                                ? [
                                                    BoxShadow(
                                                      offset:
                                                          const Offset(0, 4),
                                                      blurRadius: 16,
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                    ),
                                                  ]
                                                : [],
                                          ),
                                          child: OutlinedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginWithUae01(),
                                                  ));
                                            },
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              side: BorderSide.none,
                                              minimumSize: const Size(
                                                  double.infinity, 48),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // UAE PASS Logo
                                                Image.asset(
                                                  AppAssets.uaePassLogo,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                const SizedBox(width: 5),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'LOG IN WITH UAE PASS'
                                                          .tr(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: mainText,
                                                        letterSpacing: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      0.01.ph(context),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an account?".tr(),
                                            style: TextStyle(
                                              fontSize: context.mh * 0.014,
                                              color: subtleText,
                                            ),
                                          ),
                                          MouseRegion(
                                            onEnter: (_) => setState(() =>
                                                _hoveredButton = 'signup'),
                                            onExit: (_) => setState(
                                                () => _hoveredButton = null),
                                            child: AnimatedContainer(
                                              transform: Matrix4.identity()
                                                ..scale(
                                                    _hoveredButton == 'signup'
                                                        ? 1.05
                                                        : 1.0),
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignUpScreen(),
                                                      ));
                                                },
                                                child: Text(
                                                  'Sign up here'.tr(),
                                                  style: TextStyle(
                                                    fontSize: context.mh *
                                                            0.012,
                                                    fontWeight: FontWeight.w500,
                                                    color: richGold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Security Notice
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.lock_outline,
                                              size: 12,
                                              color: subtleText,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Secure login with 256-bit encryption'
                                                  .tr(),
                                              style: TextStyle(
                                                fontSize: context.mh * 0.012,
                                                color: subtleText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Footer
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UaePassLogoPainter extends CustomPainter {
  final Color color;

  UaePassLogoPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final scale = size.width / 100;
    final path = Path();

    // UAE PASS logo paths
    path.moveTo(30.81 * scale, 48.36 * scale);
    path.quadraticBezierTo(
        30.81 * scale, 49.94 * scale, 31.44 * scale, 52.85 * scale);
    path.quadraticBezierTo(
        31.85 * scale, 54.26 * scale, 33.44 * scale, 56.6 * scale);
    path.quadraticBezierTo(
        34.35 * scale, 57.63 * scale, 37.02 * scale, 59.12 * scale);
    path.quadraticBezierTo(
        38.49 * scale, 59.77 * scale, 42.35 * scale, 60.09 * scale);
    path.quadraticBezierTo(
        44.43 * scale, 60.09 * scale, 47.68 * scale, 59.12 * scale);
    path.quadraticBezierTo(
        49.15 * scale, 58.48 * scale, 51.25 * scale, 56.6 * scale);
    path.quadraticBezierTo(
        52.16 * scale, 55.51 * scale, 53.23 * scale, 52.85 * scale);
    path.quadraticBezierTo(
        53.64 * scale, 51.43 * scale, 53.86 * scale, 48.36 * scale);
    path.quadraticBezierTo(
        53.86 * scale, 46.78 * scale, 53.23 * scale, 43.87 * scale);
    path.quadraticBezierTo(
        52.82 * scale, 42.46 * scale, 51.25 * scale, 40.12 * scale);
    path.quadraticBezierTo(
        50.35 * scale, 39.09 * scale, 47.68 * scale, 37.6 * scale);
    path.quadraticBezierTo(
        46.21 * scale, 36.95 * scale, 42.35 * scale, 36.63 * scale);
    path.quadraticBezierTo(
        40.27 * scale, 36.63 * scale, 37.02 * scale, 37.6 * scale);
    path.quadraticBezierTo(
        35.55 * scale, 38.24 * scale, 33.44 * scale, 40.12 * scale);
    path.quadraticBezierTo(
        32.53 * scale, 41.21 * scale, 31.44 * scale, 43.87 * scale);
    path.quadraticBezierTo(
        31.03 * scale, 45.29 * scale, 30.81 * scale, 48.36 * scale);

    // Inner circle
    path.moveTo(36.38 * scale, 48.36 * scale);
    path.quadraticBezierTo(
        36.38 * scale, 47.39 * scale, 36.67 * scale, 45.54 * scale);
    path.quadraticBezierTo(
        36.87 * scale, 44.63 * scale, 37.64 * scale, 43.1 * scale);
    path.quadraticBezierTo(
        38.08 * scale, 42.39 * scale, 39.47 * scale, 41.43 * scale);
    path.quadraticBezierTo(
        40.25 * scale, 41.03 * scale, 42.35 * scale, 40.83 * scale);
    path.quadraticBezierTo(
        43.5 * scale, 40.83 * scale, 45.24 * scale, 41.43 * scale);
    path.quadraticBezierTo(
        46.02 * scale, 41.84 * scale, 47.07 * scale, 43.1 * scale);
    path.quadraticBezierTo(
        47.52 * scale, 43.81 * scale, 48.04 * scale, 45.54 * scale);
    path.quadraticBezierTo(
        48.24 * scale, 46.46 * scale, 48.33 * scale, 48.36 * scale);
    path.quadraticBezierTo(
        48.33 * scale, 49.33 * scale, 48.04 * scale, 51.17 * scale);
    path.quadraticBezierTo(
        47.84 * scale, 52.09 * scale, 47.07 * scale, 53.62 * scale);
    path.quadraticBezierTo(
        46.62 * scale, 54.33 * scale, 45.24 * scale, 55.28 * scale);
    path.quadraticBezierTo(
        44.45 * scale, 55.69 * scale, 42.35 * scale, 55.89 * scale);
    path.quadraticBezierTo(
        41.21 * scale, 55.89 * scale, 39.47 * scale, 55.28 * scale);
    path.quadraticBezierTo(
        38.69 * scale, 54.88 * scale, 37.64 * scale, 53.62 * scale);
    path.quadraticBezierTo(
        37.19 * scale, 52.9 * scale, 36.67 * scale, 51.17 * scale);
    path.quadraticBezierTo(
        36.46 * scale, 50.25 * scale, 36.38 * scale, 48.36 * scale);

    // Additional shapes
    path.moveTo(62.54 * scale, 48.77 * scale);
    path.lineTo(57.62 * scale, 57.18 * scale);
    path.lineTo(64.39 * scale, 57.18 * scale);
    path.lineTo(69.31 * scale, 48.77 * scale);
    path.close();

    path.moveTo(69.83 * scale, 36.98 * scale);
    path.lineTo(73.11 * scale, 36.67 * scale);
    path.lineTo(64.98 * scale, 36.67 * scale);
    path.lineTo(55.28 * scale, 52.41 * scale);
    path.lineTo(57.62 * scale, 59.95 * scale);
    path.lineTo(64.98 * scale, 59.95 * scale);
    path.close();

    path.moveTo(59.14 * scale, 36.63 * scale);
    path.lineTo(65.84 * scale, 36.63 * scale);
    path.lineTo(65.84 * scale, 59.95 * scale);
    path.lineTo(59.14 * scale, 59.95 * scale);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

var authCubit = DiContainer().sl<AuthenticationCubit>();
