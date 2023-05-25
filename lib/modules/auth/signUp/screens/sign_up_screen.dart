import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payaki/extensions/context_extensions.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idProofNumberController = TextEditingController();
  TextEditingController addressProofNumberController = TextEditingController();

  String? countryCode;

  XFile? idProofImage;
  XFile? addressProofImage;

  final picker = ImagePicker();

  String? selectedIdProofType;
  String? selectedAddressProofType;

  List<String> idItemList = [
    "State identification (ID) card",
    "Driver license",
    "US passport or passport card",
    "US military card",
    "Military dependents ID card",
    "Permanent Resident Card",
    "Certificate of Citizenship",
    "Certificate of Naturalization",
    "Employment Authorization Document",
    "Foreign passport"
  ];


  List<String> addressItemList = [
    "Utility bill",
    "Cable TV or internet bill",
    "Telephone bill",
    "Bank statement",
    "Property tax bill",
    "Mortgage statement"
  ];



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
                            "Let’s create your account !",
                            style: StyleUtility.headingTextStyle,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Don’t have an account? ',
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.urlTextStyle,
                                  text: 'Sign In',
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
                          hintText: "Enter your Full Name",
                          titleText: "Full Name",
                          image: ImageUtility.fullNameIcon,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: userNameController,
                          hintText: "Enter Username",
                          titleText: "Username",
                          image: ImageUtility.userNameIcon,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: emailController,
                          hintText: "Enter Email",
                          titleText: "Email",
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
                          hintText: "Enter Password",
                          titleText: "Password",
                          image: ImageUtility.passwordIcon,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DropDownWidget(
                          titleText: "Id Proof Type",
                          hintText: "Select ID Proof Type",
                          itemList: idItemList,
                          selectedValue: selectedIdProofType,
                          onValueChange: (value) {
                            selectedIdProofType = value;
                            signUpVm.notifyListeners();
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: idProofNumberController,
                          hintText: "Enter Id Proof Number",
                          titleText: "Id Proof Number",
                          //  image: ImageUtility.passwordIcon,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        UploadImageWidget(
                            onTap: () {
                              getIdImage(signUpVm);
                            },
                            title: "ID Proof"),
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
                                        signUpVm.notifyListeners();
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
                          height: 15.h,
                        ),
                        DropDownWidget(
                          titleText: "Address Proof  Type",
                          hintText: "Select Address Proof Type",
                          itemList: addressItemList,
                          selectedValue: selectedAddressProofType,
                          onValueChange: (value) {
                            selectedAddressProofType = value;
                            signUpVm.notifyListeners();
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SimpleTextField(
                          controller: addressProofNumberController,
                          hintText: "Enter Address Proof Number",
                          titleText: "Address Proof Number",
                          //  image: ImageUtility.passwordIcon,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        UploadImageWidget(
                            onTap: () {
                              getAddressImage(signUpVm);
                            },
                            title: "Address Proof"),
                        addressProofImage != null
                            ? Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.r),
                                      child: Image.file(
                                        File(addressProofImage!.path),
                                        fit: BoxFit.cover,
                                        height: 85.w,
                                        width: 85.w,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        addressProofImage = null;
                                        signUpVm.notifyListeners();
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
                                  'By clicking on “Register Now” button you are\nagree to our ',
                              style: StyleUtility.detailTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                  style: StyleUtility.urlTextStyle,
                                  text: 'Terms & Condition',
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
                              buttonText: "Register",
                              onTab: () async {
                                if (fullNameController.text.isEmpty) {
                                  context.showSnackBar(
                                      message: "Please Enter Your Full Name.");
                                } else if (userNameController.text.isEmpty) {
                                  context.showSnackBar(
                                      message: "Please Enter Your Username.");
                                } else if (emailController.text.isEmpty) {
                                  context.showSnackBar(
                                      message: "Please Enter Your Email.");
                                } else if (Validators.checkValidateEmail(
                                        emailController.text) ==
                                    false) {
                                  context.showSnackBar(
                                      message: "Please Enter Valid Email.");
                                } else if (phoneNumberController.text.isEmpty) {
                                  context.showSnackBar(
                                      message:
                                          "Please Enter Your Phone Number.");
                                } else if (passwordController.text.isEmpty) {
                                  context.showSnackBar(
                                      message: "Please Enter Your Password.");
                                } else if (selectedIdProofType == null) {
                                  context.showSnackBar(
                                      message: "Please Select ID Proof Type.");
                                } else if (idProofNumberController
                                    .text.isEmpty) {
                                  context.showSnackBar(
                                      message: "Please Enter ID Proof Number.");
                                } else if (idProofImage == null) {
                                  context.showSnackBar(
                                      message: "Please Upload ID Proof Image.");
                                } else if (selectedAddressProofType == null) {
                                  context.showSnackBar(
                                      message:
                                          "Please Select Address Proof Type.");
                                } else if (addressProofNumberController
                                    .text.isEmpty) {
                                  context.showSnackBar(
                                      message:
                                          "Please Enter Address Proof Number.");
                                } else if (addressProofImage == null) {
                                  context.showSnackBar(
                                      message:
                                          "Please Upload Address Proof Image.");
                                } else {
                                  MultipartFile idImageFile =
                                      await MultipartFile.fromFile(
                                    idProofImage!.path,
                                    filename: idProofImage!.name,
                                  );
                                  MultipartFile addressImageFile =
                                      await MultipartFile.fromFile(
                                    addressProofImage!.path,
                                    filename: addressProofImage!.name,
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
                                      addressProofType:
                                          selectedAddressProofType,
                                      addressProofNumber:
                                          addressProofNumberController.text,
                                      addressProof: addressImageFile,
                                    ),
                                    onSuccess: (value) {
                                      Navigator.pop(context);
                                      context.showToast(message: value);
                                      Navigator.pushReplacementNamed(context,
                                          RouteName.bottomNavigationBarScreen);
                                    },
                                    onFailure: (value) {
                                      Navigator.pop(context);
                                      context.showSnackBar(message: value);
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
                                  "Or continue with",
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
                            // SizedBox(
                            //   width: 20.w,
                            // ),
                            // Container(
                            //   height: 55.w,
                            //   width: 55.w,
                            //   padding: EdgeInsets.all(15.sp),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10.r),
                            //       color: ColorUtility.colorEFEFEF),
                            //   child: Image.asset(ImageUtility.faceBookIcon),
                            // ),
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

  Future getIdImage(SignUpVm signUpVm) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      idProofImage = pickedFile;
      signUpVm.notifyListeners();
    } else {}
  }

  Future getAddressImage(SignUpVm signUpVm) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      addressProofImage = pickedFile;
      signUpVm.notifyListeners();
    } else {}
  }

  Future<void> googleAuth(SignUpVm signUpVm) async {
    try {
      final user = await googleSignIn.signIn();
      if (user != null) {
        logD(user.displayName);
        logD("id${user.id}");
        logD(user.email);
        logD(user.photoUrl);
        googleLogIn(signUpVm, user.id);
      }
    } catch (error) {
      logE(error);
    }
  }

  googleLogIn(SignUpVm signUpVm, String id) {
    CommonDialog.showLoadingDialog(context);
    signUpVm.socialLoginApi(
        request: sr.SocialLoginRequest(
            name: Endpoints.auth.socialLogin,
            param: sr.Param(oauthProvider: "google", oauthUid: id)),
        onSuccess: (value) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
              context, RouteName.bottomNavigationBarScreen);
        },
        onFailure: (value) {
          Navigator.pop(context);
          context.showSnackBar(message: value);
        });
  }
}
