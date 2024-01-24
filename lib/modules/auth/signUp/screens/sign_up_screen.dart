import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
import 'package:payaki/integration/firebase_integration.dart';
import 'package:payaki/logger/app_logger.dart';
import 'package:payaki/modules/auth/signUp/provider/signup_screen_vm.dart';
import 'package:payaki/network/end_points.dart';
import 'package:payaki/network/model/request/loginSignup/signup_request.dart';
import 'package:payaki/network/model/request/loginSignup/social_login_request.dart'
    as sr;
import 'package:payaki/routes/route_name.dart';
import 'package:payaki/utilities/color_utility.dart';
import 'package:payaki/utilities/common_dialog.dart';
import 'package:payaki/utilities/constants.dart';
import 'package:payaki/utilities/validators.dart';
import 'package:payaki/widgets/custom_button.dart';
import 'package:payaki/utilities/image_utility.dart';
import 'package:payaki/utilities/style_utility.dart';
import 'package:payaki/utilities/text_size_utility.dart';
import 'package:payaki/widgets/dropdown_widget.dart';
import 'package:payaki/widgets/mobile_number_text_field.dart';
import 'package:payaki/widgets/simple_text_field.dart';
import 'package:payaki/widgets/upload_image_widget.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idProofNumberController = TextEditingController();

  String? countryCode;
  XFile? idProofImage;
  final picker = ImagePicker();
  String? selectedIdProofType;
  List<String> idItemList = ["Bilhete de Identidade (BI)", "Passaporte"];
  String? deviceToken;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  getToken() async {
    deviceToken = await FirebaseIntegration().getFirebaseToken();
    logD("Token $deviceToken");
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorUtility.colorEFF6EE,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          bottom: false,
          child: Consumer<SignUpVm>(builder: (context, signUpVm, child) {
            return Column(
              children: [
                Container(
                  height: height * 0.35,
                  padding:
                      EdgeInsets.symmetric(horizontal: 44.w, vertical: 30.h),
                  child: Center(
                    child: Image.asset(
                      ImageUtility.signUpBoardImage,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: height * 0.65,
                  ),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.h),
                  decoration: BoxDecoration(
                      color: ColorUtility.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      )),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            S.of(context).LetsCreateYourAccount,
                            style: StyleUtility.headingTextStyle,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: S.of(context).DidNotHaveAnAccount,
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.urlTextStyle,
                                  text: S.of(context).signIn,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                          context, RouteName.logInScreen);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SimpleTextField(
                          controller: fullNameController,
                          hintText: S.of(context).enterFullName,
                          titleText:S.of(context).fullName,
                          image: ImageUtility.fullNameIcon,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: userNameController,
                          hintText: S.of(context).enterUserName,
                          titleText: S.of(context).userName,
                          image: ImageUtility.userNameIcon,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: emailController,
                          hintText: S.of(context).EnterEmail,
                          titleText:S.of(context).Email,
                          image: ImageUtility.emailIcon,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        MobileNumberTextField(
                            controller: phoneNumberController,
                            onChanged: (phone) {
                              countryCode = phone.countryCode;
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: passwordController,
                          hintText:S.of(context).EnterPassword,
                          titleText: S.of(context).Password,
                          image: ImageUtility.passwordIcon,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DropDownWidget(
                          titleText: S.of(context).idProofType,
                          hintText: S.of(context).selectYourIdProofType,
                          itemList: idItemList,
                          selectedValue: selectedIdProofType,
                          onValueChange: (value) {
                            selectedIdProofType = value;
                            signUpVm.updateUi();
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: idProofNumberController,
                          hintText: S.of(context).enterIdProofNumber,
                          titleText: S.of(context).idProofNumber,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        UploadImageWidget(
                            onTap: () {
                              showBottomSheetForSelectImage(signUpVm);
                            },
                            title: S.of(context).idProof),
                        idProofImage != null
                            ? Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child: Image.file(
                                        File(idProofImage!.path),
                                        fit: BoxFit.cover,
                                        height: 85.w,
                                        width: 85.w,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        idProofImage = null;
                                        signUpVm.updateUi();
                                      },
                                      child: Container(
                                        height: 85.w,
                                        width: 85.w,
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.all(3.sp),
                                        child: Image.asset(
                                          ImageUtility.removeImage,
                                          width: 15.w,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: 60.h,
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                              S.of(context).byClickingOnRegisterNow,
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.urlTextStyle,
                                  text: S.of(context).termsAndConditions,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 37.h,
                        ),
                        Consumer<SignUpVm>(builder: (context, model, child) {
                          return CustomButton(
                              buttonText: S.of(context).register,
                              onTab: () async {
                                if (fullNameController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterYourFullName);
                                } else if (userNameController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterYourUsername);
                                } else if (emailController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterEmail);
                                } else if (Validators.checkValidateEmail(
                                        emailController.text) ==
                                    false) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterValidEmail);
                                } else if (phoneNumberController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message:
                                      S.of(context).pleaseEnterYourPhoneNumber);
                                } else if (passwordController.text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterPassword);
                                } else if (selectedIdProofType == null) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseSelectIDProofType);
                                } else if (idProofNumberController
                                    .text.isEmpty) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseEnterIDProofNumber);
                                } else if (idProofImage == null) {
                                  context.flushBarTopErrorMessage(
                                      message: S.of(context).pleaseUploadIDProofImage);
                                } else {
                                  MultipartFile idImageFile =
                                      await MultipartFile.fromFile(
                                    idProofImage!.path,
                                    filename: idProofImage!.name,
                                  );
                                  CommonDialog.showLoadingDialog(context);
                                  model.signUp(
                                    request: SignUpRequest(
                                        name: Endpoints.auth.signup,
                                        fullName: fullNameController.text,
                                        userName: userNameController.text,
                                        email: emailController.text,
                                        phone: phoneNumberController.text,
                                        countryCode: countryCode,
                                        pass: passwordController.text,
                                        idProofType: selectedIdProofType,
                                        idProofNumber:
                                            idProofNumberController.text,
                                        idProof: idImageFile,
                                        deviceType: Platform.isAndroid
                                            ? Constant.android
                                            : Constant.ios,
                                        deviceToken: deviceToken),
                                    onSuccess: (value) {
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(context,
                                          RouteName.bottomNavigationBarScreen);

                                      context.flushBarTopSuccessMessage(
                                          message: value);
                                    },
                                    onFailure: (value) {
                                      Navigator.pop(context);
                                      context.flushBarTopErrorMessage(
                                          message: value);
                                    },
                                  );
                                }
                              });
                        }),
                        SizedBox(
                          height: 28.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.w),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                color: ColorUtility.colorBCBCBC,
                                height: 1,
                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  S.of(context).orContinueWith,
                                  style: StyleUtility.axiforma400.copyWith(
                                      fontSize: TextSizeUtility.textSize12,
                                      color: ColorUtility.colorBCBCBC),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                color: ColorUtility.colorBCBCBC,
                                height: 1,
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  googleAuth(signUpVm);
                                },
                                child: Container(
                                  height: 55.w,
                                  width: 55.w,
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: ColorUtility.colorEFEFEF),
                                  child: Image.asset(ImageUtility.googleIcon),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  showBottomSheetForSelectImage(SignUpVm signUpVm) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.sp,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    getIdImage(signUpVm, "Camera");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          color: ColorUtility.colorF5F6FA,
                          child: Center(
                            child: Image.asset(
                              ImageUtility.cameraIcon,
                              width: 45.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        S.of(context).camera,
                        style: StyleUtility.titleTextStyle
                            .copyWith(fontSize: TextSizeUtility.textSize20),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    getIdImage(signUpVm, "Gallery");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 100.w,
                          height: 100.w,
                          color: ColorUtility.colorF5F6FA,
                          child: Center(
                            child: Image.asset(
                              ImageUtility.galleryIcon,
                              width: 45.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        S.of(context).gallery,
                        style: StyleUtility.titleTextStyle
                            .copyWith(fontSize: TextSizeUtility.textSize20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getIdImage(SignUpVm signUpVm, String from) async {
    XFile? pickedFile;
    if (from == "Gallery") {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }
    if (pickedFile != null) {
      idProofImage = pickedFile;
      signUpVm.updateUi();
    }
  }

  Future<void> googleAuth(SignUpVm signUpVm) async {
    try {
      final user = await googleSignIn.signIn();
      if (user != null) {
        logD(user.displayName);
        logD("id${user.id}");
        logD(user.email);
        logD(user.photoUrl);
        googleLogIn(signUpVm, user.id, user.email);
      }
    } catch (error) {
      logE(error);
    }
  }

  googleLogIn(SignUpVm signUpVm, String id, email) {
    CommonDialog.showLoadingDialog(context);
    signUpVm.socialLoginApi(
        request: sr.SocialLoginRequest(
            name: Endpoints.auth.socialLogin,
            param: sr.Param(
                oauthProvider: "google",
                oauthUid: id,
                email: email,
                deviceType:
                    Platform.isAndroid ? Constant.android : Constant.ios,
                deviceToken: deviceToken)),
        onSuccess: (value) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
              context, RouteName.bottomNavigationBarScreen);
        },
        onFailure: (value) {
          Navigator.pop(context);
          context.flushBarTopErrorMessage(message: value);
        });
  }
}
