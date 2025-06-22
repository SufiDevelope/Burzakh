import 'package:burzakh/Extenshion/extenshion.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:burzakh/constants/app_assets.dart';
import 'package:burzakh/constants/app_widgets_size.dart';
import 'package:burzakh/core/app/di_container.dart';
import 'package:burzakh/core/extensions/show_message.dart';
import 'package:burzakh/features/authentication/presentation/controller/cubit.dart';
import 'package:burzakh/features/authentication/presentation/controller/state.dart';
import 'package:burzakh/features/authentication/presentation/page/login.dart';
import 'package:burzakh/features/authentication/presentation/page/signup_with_uae.dart';
import 'package:burzakh/widgets/app_text.dart';
import 'package:burzakh/widgets/custom_button.dart';
import 'package:burzakh/widgets/custom_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_text_style.dart';
import '../../../../constants/media_query.dart';
import '../../../../core/theme/AppColor.dart';
import '../widgets/password_info_dialog.dart';
import 'login_01.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  String _password = '';
  String _passwordError = '';
  int _passwordStrength = 0;

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

  int checkPasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 6) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password)) strength++;
    if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) strength++;
    return strength;
  }

  void handlePasswordChange(String value) {
    setState(() {
      _password = value;
      _passwordStrength = checkPasswordStrength(value);
      if (_passwordError.isNotEmpty && value.length >= 6) _passwordError = '';
    });
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
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Start from bottom
      end: Offset.zero, // End at normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Start animation on first build
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose controller
    super.dispose();
  }

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController marsoom = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  bool _rememberMe = false;
  // Color palette
  final Map<String, Color> colors = {
    'background1': const Color(0xFFFBF7F2),
    'background2': const Color(0xFFF2EDE6),
    'cardBg': const Color(0xF2FFFDF),
    'primary': const Color(0xFF053B30),
    'primaryLight': const Color(0xFF0D4E40),
    'secondary': const Color(0xFFAD8442),
    'secondaryLight': const Color(0xFFD9C9A8),
    'text': const Color(0xFF1A1914),
    'subtleText': const Color(0xFF5F5A51),
    'placeholder': const Color(0xFFA9A49E),
    'success': const Color(0xFF3B8A5C),
    'error': const Color(0xFFC75050),
    'errorLight': const Color(0xFFFFF5F5),
    'successLight': const Color(0xFFF0FFF4),
  };
  String? fullNumber = ''; // Default country name
  String? phones;
  String? selectedCountryCode = 'AE';

  // static const Color primaryEmerald = Color(0xFF053B30);
  // static const Color primaryGradientStart = Color(0xFF0D4E40);
  // static const Color richGold = Color(0xFFAD8442);
  // static const Color subtleText = Color(0xFF5F5A51);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFf1efe9), Color(0xFFf1efe9), Color(0xFFf1efe9)],
        )),
        height: mdHeight(context) * 1,
        width: mdWidth(context) * 1,
        // decoration: BoxDecoration(
        //     image:DecorationImage(image: AssetImage(AppAssets.bgImage),fit: BoxFit.fitHeight)
        // ),
        child: SlideTransition(
          position: _animation,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenPaddingHori),
              child: SingleChildScrollView(
                child: BlocBuilder(
                    bloc: authCubit,
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.appLogo,
                            width: context.mw * 0.15,
                            height: context.mh * 0.15,
                          ),
                          0.01.ph(context),
                          AppText(
                            text: 'Create an account',
                            fontWeight: FontWeight.w300,
                            fontSize: context.mh * 0.02,
                          ),
                          0.01.ph(context),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: 'Account Setup',
                                      fontWeight: FontWeight.w300,
                                      fontSize: text2,
                                      color: AppColor.darkYellow(),
                                    ),
                                    AppText(
                                      text: 'Step 1 of 1',
                                      fontWeight: FontWeight.w300,
                                      fontSize: text2,
                                      color: AppColor.darkYellow(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                  color: AppColor.darkYellow(),
                                  height: 2,
                                ),
                              ],
                            ),
                          ),
                          0.015.ph(context),
                          CustomTextFormField(
                            controller: fname,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            borderColor: AppColor.fieldYellowBorder(),
                            subTitle: 'First Name *',
                            isNeedLabelText: false,
                          ),
                          0.015.ph(context),
                          CustomTextFormField(
                              controller: lname,
                              hintTextStyle:
                                  AppTextStyle.hintTextStyleWithFont(),
                              borderColor: AppColor.fieldYellowBorder(),
                              subTitle: 'Last Name *',
                              isNeedLabelText: false),
                          0.015.ph(context),
                          CustomTextFormField(
                            controller: password,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            borderColor: AppColor.fieldYellowBorder(),
                            subTitle: 'Password *',
                            onChanged:
                                handlePasswordChange, // Add this line - this was missing!
                            onSuffixTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            isNeedLabelText: false,
                            maxLines: 1,
                            isObSecure:
                                !_showPassword, // Fix: should be !_showPassword for proper toggle
                            sufixIcon: !_showPassword
                                ? AppAssets.eyeOpen
                                : AppAssets.eyeClosed,
                            suffixSize: !_showPassword ? 12 : 18,
                          ),
                          if (_password.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: List.generate(4, (index) {
                                      return Expanded(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(right: 4),
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: index < _passwordStrength
                                                ? getPasswordStrengthColor()
                                                : defaultBorder,
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    getPasswordStrengthText().tr(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: getPasswordStrengthColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          if (_passwordError.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    size: 12,
                                    color: error,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _passwordError.tr(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            0.015.ph(context),

                          CustomTextFormField(
                            controller: confirm_password,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            borderColor: AppColor.fieldYellowBorder(),
                            subTitle: 'Confirm Password *',
                            // onChanged: handlePasswordChange,
                            onSuffixTap: () {
                              setState(() {
                                _showConfirmPassword = !_showConfirmPassword;
                              });
                            },
                            isNeedLabelText: false,
                            maxLines: 1,
                            isObSecure:
                                !_showConfirmPassword, // Fix: should be !_showPassword for proper toggle
                            sufixIcon: !_showConfirmPassword
                                ? AppAssets.eyeOpen
                                : AppAssets.eyeClosed,
                            suffixSize: !_showConfirmPassword ? 12 : 18,
                          ),
                          0.015.ph(context),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(fieldRadius)),
                            child: IntlPhoneField(
                              disableLengthCheck: true,
                              cursorColor: AppColor.primary(),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                labelStyle:
                                    AppTextStyle.hintTextStyleWithFont(),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(fieldRadius),
                                  borderSide: BorderSide(
                                      color: AppColor.fieldYellowBorder()),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(fieldRadius),
                                  borderSide: BorderSide(
                                      color: AppColor.fieldYellowBorder()),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(fieldRadius),
                                  borderSide: BorderSide(
                                      color: AppColor.fieldYellowBorder()),
                                ),
                                hintStyle: AppTextStyle.hintTextStyleWithFont(),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(fieldRadius),
                                  borderSide: BorderSide(
                                      color: AppColor.fieldYellowBorder()),
                                ),
                                hintText: 'Phone Number *'.tr(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(fieldRadius)),
                                  borderSide: BorderSide(
                                      color: AppColor.fieldYellowBorder(),
                                      width: 1),
                                ),
                              ),
                              initialCountryCode: selectedCountryCode,
                              controller: phoneNumber,
                              onChanged: (phone) {
                                phones = phone.number;
                                selectedCountryCode = phone.countryCode;
                                setState(() {
                                  fullNumber =
                                      "${phone.countryCode}${phone.number}";
                                });
                              },
                            ),
                          ),
                          // CustomTextFormField(controller: phoneNumber, subTitle: ''),
                          0.015.ph(context),
                          CustomTextFormField(
                            controller: email,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            isNeedLabelText: false,
                            borderColor: AppColor.fieldYellowBorder(),
                            subTitle: 'Email address *',
                            textInputAction: TextInputAction.done,
                          ),
                          0.015.ph(context),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: colors['secondary']!.withOpacity(0.15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.description_outlined,
                                      size: 16,
                                      color: colors['secondary'],
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'DOCUMENTS'.tr(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colors['secondary'],
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: colors['secondary']!.withOpacity(0.15),
                                ),
                              ),
                            ],
                          ),
                          0.015.ph(context),
                          CustomTextFormField(
                            readOnly: true,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            onTap: () {
                              authCubit.pickPassport();
                            },
                            controller: passport,
                            borderColor: AppColor.fieldYellowBorder(),
                            suffixIconColor: AppColor.darkYellow(),
                            isSuffixCircle: true,
                            subTitle: 'Passport copy *',
                            textInputAction: TextInputAction.done,
                            sufixIcon: authCubit.passportCopy != null
                                ? AppAssets.tickIcon
                                : AppAssets.uploadIcon,
                          ),
                          // SizedBox(height: commonHeightS,),
                          // CustomTextFormField(readOnly: true, onTap: () {
                          //   authCubit.pickUaePass();
                          // },controller: passport,borderColor: AppColor.fieldYellowBorder(),suffixIconColor:  AppColor.darkYellow(),subTitle: 'UAE pass *',isSuffixCircle: true,textInputAction: TextInputAction.done,sufixIcon:authCubit.uaePass!=null? AppAssets.tickIcon: AppAssets.uploadIcon,),
                          0.015.ph(context),
                          CustomTextFormField(
                            readOnly: true,
                            hintTextStyle: AppTextStyle.hintTextStyleWithFont(),
                            onTap: () {
                              authCubit.pickMarsoom();
                            },
                            controller: marsoom,
                            borderColor: AppColor.fieldYellowBorder(),
                            suffixIconColor: AppColor.darkYellow(),
                            subTitle: 'Marsoom (Optional)',
                            isSuffixCircle: true,
                            textInputAction: TextInputAction.done,
                            sufixIcon: authCubit.marsoom != null
                                ? AppAssets.tickIcon
                                : AppAssets.uploadIcon,
                          ),

                          SizedBox(
                            height: commonHeightS,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Wrap(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _rememberMe = !_rememberMe;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          gradient: _rememberMe
                                              ? const LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    primaryGradientStart,
                                                    primaryEmerald,
                                                  ],
                                                )
                                              : null,
                                          color:
                                              _rememberMe ? null : Colors.white,
                                          border: Border.all(
                                            color: richGold.withOpacity(0.3),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                      'I agree to the'.tr(),
                                      style: TextStyle(
                                        fontSize: context.mh * 0.014,
                                        color: subtleText,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Terms and Conditions'.tr(),
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.darkYellow(),
                                        fontSize: context.mh * 0.014,
                                        color: AppColor.darkYellow(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'and'.tr(),
                                      style: TextStyle(
                                        fontSize: context.mh * 0.014,
                                        color: subtleText,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Privacy Policy'.tr(),
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColor.darkYellow(),
                                        fontSize: context.mh * 0.014,
                                        color: AppColor.darkYellow(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          0.015.ph(context),
                          CustomElevatedButton(
                            onPressed: () {
                              if (fname.text.isEmpty ||
                                  lname.text.isEmpty ||
                                  password.text.isEmpty ||
                                  phoneNumber.text.isEmpty ||
                                  email.text.isEmpty ||
                                  authCubit.passportCopy == null) {
                                showMessage("Please Enter all required fields",
                                    isError: true);
                              } else {
                                if (checkPasswordStrength(password.text) < 4) {
                                  showMessage("Your password is not Strong",
                                      isError: true);
                                } else if (_rememberMe == false) {
                                  showMessage(
                                      "You must agree to the terms and condition",
                                      isError: true);
                                } else {
                                  authCubit.signup(
                                    fname: fname.text,
                                    lname: lname.text,
                                    password: password.text,
                                    phoneNumber: fullNumber ?? "",
                                    email: email.text,
                                    confirmPassword: confirm_password.text,
                                  );
                                }
                              }
                            },
                            isLoading: authCubit.isSignUpLoading,
                            text: 'SIGN UP',
                            bgColor: AppColor.buttonColor,
                            textColor: AppColor.white(),
                            fontWeight: FontWeight.w600,
                            fontSize: context.mh * 0.018,
                          ),
                          // SizedBox(height: commonHeightS,),
                          // CustomElevatedButton(onPressed: (){
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpWithUae(),));
                          // }, text: 'SIGN UP WITH UAE PASS',bgColor: AppColor.white(),showBorder: true,borderColor: AppColor.primary(),fontWeight: FontWeight.w600,textColor: AppColor.primary(),fontFamily: 'nb',),
                          0.02.ph(context),

                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BurzakhEnhancedLogin(),
                                    ));
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account".tr(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: subtleText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  AppText(
                                    text: "Login",
                                    color: AppColor.darkYellow(),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'ns',
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: appBottomMargin,
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  var authCubit = DiContainer().sl<AuthenticationCubit>();
}
