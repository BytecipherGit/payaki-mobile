// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello, World!`
  String get helloWorld {
    return Intl.message(
      'Hello, World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeMessage {
    return Intl.message(
      'Welcome',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Browse Categories`
  String get browseCategories {
    return Intl.message(
      'Browse Categories',
      name: 'browseCategories',
      desc: '',
      args: [],
    );
  }

  /// `Premium Ad`
  String get premiumAd {
    return Intl.message(
      'Premium Ad',
      name: 'premiumAd',
      desc: '',
      args: [],
    );
  }

  /// `Latest Ad`
  String get latestAd {
    return Intl.message(
      'Latest Ad',
      name: 'latestAd',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sell {
    return Intl.message(
      'Sell',
      name: 'sell',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your account here`
  String get pleaseEnterYourAccountHere {
    return Intl.message(
      'Please enter your account here',
      name: 'pleaseEnterYourAccountHere',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get EnterEmail {
    return Intl.message(
      'Enter Email',
      name: 'EnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get EnterPassword {
    return Intl.message(
      'Enter Password',
      name: 'EnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get RememberMe {
    return Intl.message(
      'Remember me',
      name: 'RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Recovery password`
  String get RecoveryPassword {
    return Intl.message(
      'Recovery password',
      name: 'RecoveryPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get LogIn {
    return Intl.message(
      'Log In',
      name: 'LogIn',
      desc: '',
      args: [],
    );
  }

  /// `Log In with Phone`
  String get LogInWithPhone {
    return Intl.message(
      'Log In with Phone',
      name: 'LogInWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account ?\n`
  String get DidNotHaveAnAccount {
    return Intl.message(
      'Don’t have an account ?\n',
      name: 'DidNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Let’s create your account !`
  String get LetsCreateYourAccount {
    return Intl.message(
      'Let’s create your account !',
      name: 'LetsCreateYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account ?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account ?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter your Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Full Name`
  String get enterUserName {
    return Intl.message(
      'Enter your Full Name',
      name: 'enterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your Phone Number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Id Proof  Type`
  String get idProofType {
    return Intl.message(
      'Id Proof  Type',
      name: 'idProofType',
      desc: '',
      args: [],
    );
  }

  /// `Select ID Proof Type`
  String get selectYourIdProofType {
    return Intl.message(
      'Select ID Proof Type',
      name: 'selectYourIdProofType',
      desc: '',
      args: [],
    );
  }

  /// `Id Proof Number`
  String get idProofNumber {
    return Intl.message(
      'Id Proof Number',
      name: 'idProofNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID Proof Number`
  String get enterIdProofNumber {
    return Intl.message(
      'Enter ID Proof Number',
      name: 'enterIdProofNumber',
      desc: '',
      args: [],
    );
  }

  /// `Upload Images`
  String get uploadImage {
    return Intl.message(
      'Upload Images',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `ID Proof`
  String get idProof {
    return Intl.message(
      'ID Proof',
      name: 'idProof',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory only JPG, pNG, JPEG file accepted`
  String get mandatoryOlyJPGPNG {
    return Intl.message(
      'Mandatory only JPG, pNG, JPEG file accepted',
      name: 'mandatoryOlyJPGPNG',
      desc: '',
      args: [],
    );
  }

  /// `By clicking on “Register Now” button you are\nagree to our `
  String get byClickingOnRegisterNow {
    return Intl.message(
      'By clicking on “Register Now” button you are\nagree to our ',
      name: 'byClickingOnRegisterNow',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Condition',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Mobile Number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter your Mobile Number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOTP {
    return Intl.message(
      'Send OTP',
      name: 'sendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Please enter OTP which has been sent to your\nPhone Number`
  String get pleaseEnterOTPWhichHasBeenSentToYour {
    return Intl.message(
      'Please enter OTP which has been sent to your\nPhone Number',
      name: 'pleaseEnterOTPWhichHasBeenSentToYour',
      desc: '',
      args: [],
    );
  }

  /// `Please enter OTP which has been sent to your\nEmail`
  String get pleaseEnterOTPWhichHasBeenSentToYourEmail {
    return Intl.message(
      'Please enter OTP which has been sent to your\nEmail',
      name: 'pleaseEnterOTPWhichHasBeenSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get OTP {
    return Intl.message(
      'OTP',
      name: 'OTP',
      desc: '',
      args: [],
    );
  }

  /// `Sec Left`
  String get secLeft {
    return Intl.message(
      'Sec Left',
      name: 'secLeft',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t received OTP ?`
  String get didNotReceivedOTP {
    return Intl.message(
      'Didn’t received OTP ?',
      name: 'didNotReceivedOTP',
      desc: '',
      args: [],
    );
  }

  /// ` Resend OTP`
  String get resendOTP {
    return Intl.message(
      ' Resend OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOTP {
    return Intl.message(
      'Verify OTP',
      name: 'verifyOTP',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `My Ads`
  String get myAd {
    return Intl.message(
      'My Ads',
      name: 'myAd',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Forget  Password`
  String get forgetPassword {
    return Intl.message(
      'Forget  Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Old Password`
  String get enterOldPassword {
    return Intl.message(
      'Enter Old Password',
      name: 'enterOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirm Password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter Confirm Password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Password has been\nchange successfully`
  String get passwordHasBeenChangedSuccessfully {
    return Intl.message(
      'Password has been\nchange successfully',
      name: 'passwordHasBeenChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your Password has been change successfully`
  String get yourPasswordHasBeenChangedSuccessfully {
    return Intl.message(
      'Your Password has been change successfully',
      name: 'yourPasswordHasBeenChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `mobile number Verified\nsuccessfully`
  String get mobileNumberVerifiedSuccessfully {
    return Intl.message(
      'mobile number Verified\nsuccessfully',
      name: 'mobileNumberVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your Mobile number has been Verified successfully`
  String get yourMobileNumberVerifiedSuccessfully {
    return Intl.message(
      'Your Mobile number has been Verified successfully',
      name: 'yourMobileNumberVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification `
  String get emailVerification {
    return Intl.message(
      'Email Verification ',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Email Verified\nsuccessfully`
  String get emailVerifiedSuccessfully {
    return Intl.message(
      'Email Verified\nsuccessfully',
      name: 'emailVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Your Email has been Verified successfully`
  String get yourEmailVerifiedSuccessfully {
    return Intl.message(
      'Your Email has been Verified successfully',
      name: 'yourEmailVerifiedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Back to Log In`
  String get backTOLogin {
    return Intl.message(
      'Back to Log In',
      name: 'backTOLogin',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `AddLocation`
  String get addLocation {
    return Intl.message(
      'AddLocation',
      name: 'addLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `enterLocation`
  String get enterLocation {
    return Intl.message(
      'enterLocation',
      name: 'enterLocation',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No Post Found`
  String get noPostFound {
    return Intl.message(
      'No Post Found',
      name: 'noPostFound',
      desc: '',
      args: [],
    );
  }

  /// `Result for`
  String get resultsFor {
    return Intl.message(
      'Result for',
      name: 'resultsFor',
      desc: '',
      args: [],
    );
  }

  /// `Ads Found`
  String get adsFound {
    return Intl.message(
      'Ads Found',
      name: 'adsFound',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message(
      'Sort by',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Price : Low to High`
  String get priceLowToHigh {
    return Intl.message(
      'Price : Low to High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price : High to low`
  String get priceHighToLow {
    return Intl.message(
      'Price : High to low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message(
      'Price Range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Post Ad`
  String get postAd {
    return Intl.message(
      'Post Ad',
      name: 'postAd',
      desc: '',
      args: [],
    );
  }

  /// `Choose Category`
  String get chooseCategory {
    return Intl.message(
      'Choose Category',
      name: 'chooseCategory',
      desc: '',
      args: [],
    );
  }

  /// `Ads Details`
  String get adsDetails {
    return Intl.message(
      'Ads Details',
      name: 'adsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Title *`
  String get titleRequired {
    return Intl.message(
      'Title *',
      name: 'titleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Title for your advertise`
  String get titleForYourAdd {
    return Intl.message(
      'Title for your advertise',
      name: 'titleForYourAdd',
      desc: '',
      args: [],
    );
  }

  /// `Tag *`
  String get tag {
    return Intl.message(
      'Tag *',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `Enter the tags separated by commas`
  String get enterTheTagsSeparatedByCommas {
    return Intl.message(
      'Enter the tags separated by commas',
      name: 'enterTheTagsSeparatedByCommas',
      desc: '',
      args: [],
    );
  }

  /// `Description *`
  String get description {
    return Intl.message(
      'Description *',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionDetail {
    return Intl.message(
      'Description',
      name: 'descriptionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Tell us more about your advertise`
  String get tellUsMoreAboutYourAdd {
    return Intl.message(
      'Tell us more about your advertise',
      name: 'tellUsMoreAboutYourAdd',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Set a Price`
  String get setAPrice {
    return Intl.message(
      'Set a Price',
      name: 'setAPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price *`
  String get price {
    return Intl.message(
      'Price *',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enterPrice {
    return Intl.message(
      'Enter Price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Negotiate Price`
  String get negotiatePrice {
    return Intl.message(
      'Negotiate Price',
      name: 'negotiatePrice',
      desc: '',
      args: [],
    );
  }

  /// `Attach File`
  String get attachFile {
    return Intl.message(
      'Attach File',
      name: 'attachFile',
      desc: '',
      args: [],
    );
  }

  /// `Expire Ad`
  String get expireAd {
    return Intl.message(
      'Expire Ad',
      name: 'expireAd',
      desc: '',
      args: [],
    );
  }

  /// `Select Expire Days`
  String get selectExpireDays {
    return Intl.message(
      'Select Expire Days',
      name: 'selectExpireDays',
      desc: '',
      args: [],
    );
  }

  /// `Seller Name`
  String get sellerName {
    return Intl.message(
      'Seller Name',
      name: 'sellerName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your brand name`
  String get enterYOurBrandName {
    return Intl.message(
      'Enter your brand name',
      name: 'enterYOurBrandName',
      desc: '',
      args: [],
    );
  }

  /// `Make your Ad Premium`
  String get makeYourAdPremium {
    return Intl.message(
      'Make your Ad Premium',
      name: 'makeYourAdPremium',
      desc: '',
      args: [],
    );
  }

  /// `Free Ad`
  String get freeAd {
    return Intl.message(
      'Free Ad',
      name: 'freeAd',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message(
      'Premium',
      name: 'premium',
      desc: '',
      args: [],
    );
  }

  /// `RECOMMENDED`
  String get recommended {
    return Intl.message(
      'RECOMMENDED',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Featured`
  String get featured {
    return Intl.message(
      'Featured',
      name: 'featured',
      desc: '',
      args: [],
    );
  }

  /// `Urgent`
  String get urgent {
    return Intl.message(
      'Urgent',
      name: 'urgent',
      desc: '',
      args: [],
    );
  }

  /// `Post Add`
  String get postAdd {
    return Intl.message(
      'Post Add',
      name: 'postAdd',
      desc: '',
      args: [],
    );
  }

  /// `Make your ad stand out and let viewer know that your advertise is time sensitive.`
  String get urgentDetails {
    return Intl.message(
      'Make your ad stand out and let viewer know that your advertise is time sensitive.',
      name: 'urgentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Featured ads attract higher-quality viewer and are displayed prominently in the Featured ads section home page.`
  String get featuredDetails {
    return Intl.message(
      'Featured ads attract higher-quality viewer and are displayed prominently in the Featured ads section home page.',
      name: 'featuredDetails',
      desc: '',
      args: [],
    );
  }

  /// `Highlight`
  String get highlight {
    return Intl.message(
      'Highlight',
      name: 'highlight',
      desc: '',
      args: [],
    );
  }

  /// `Make your ad highlighted with border in listing search result page. Easy to focus.`
  String get highlightDetails {
    return Intl.message(
      'Make your ad highlighted with border in listing search result page. Easy to focus.',
      name: 'highlightDetails',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Write your message`
  String get writeYourMessage {
    return Intl.message(
      'Write your message',
      name: 'writeYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message(
      'Training',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Promo Image`
  String get promoImage {
    return Intl.message(
      'Promo Image',
      name: 'promoImage',
      desc: '',
      args: [],
    );
  }

  /// `Promo Video`
  String get promoVideo {
    return Intl.message(
      'Promo Video',
      name: 'promoVideo',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory only mP4, AVI file accepted`
  String get mandatoryOnlyVideoType {
    return Intl.message(
      'Mandatory only mP4, AVI file accepted',
      name: 'mandatoryOnlyVideoType',
      desc: '',
      args: [],
    );
  }

  /// `Attach Video File`
  String get attachVideoFile {
    return Intl.message(
      'Attach Video File',
      name: 'attachVideoFile',
      desc: '',
      args: [],
    );
  }

  /// `Posted By`
  String get postedBy {
    return Intl.message(
      'Posted By',
      name: 'postedBy',
      desc: '',
      args: [],
    );
  }

  /// `PurchaseTraining`
  String get purchaseTraining {
    return Intl.message(
      'PurchaseTraining',
      name: 'purchaseTraining',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get event {
    return Intl.message(
      'Event',
      name: 'event',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Event - Add Ticket`
  String get eventAddTicket {
    return Intl.message(
      'Event - Add Ticket',
      name: 'eventAddTicket',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Quantity *`
  String get quantityRequired {
    return Intl.message(
      'Quantity *',
      name: 'quantityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Selling Mode*`
  String get sellingMode {
    return Intl.message(
      'Selling Mode*',
      name: 'sellingMode',
      desc: '',
      args: [],
    );
  }

  /// `Select Selling Mode`
  String get selectSellingMode {
    return Intl.message(
      'Select Selling Mode',
      name: 'selectSellingMode',
      desc: '',
      args: [],
    );
  }

  /// `Remove Ticket`
  String get removeTicket {
    return Intl.message(
      'Remove Ticket',
      name: 'removeTicket',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete \nthis Ticket ?`
  String get removeTicketPopUp {
    return Intl.message(
      'Are you sure you want to delete \nthis Ticket ?',
      name: 'removeTicketPopUp',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `offline`
  String get offline {
    return Intl.message(
      'offline',
      name: 'offline',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message(
      'Add to Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `online`
  String get online {
    return Intl.message(
      'online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Purchase`
  String get purchase {
    return Intl.message(
      'Purchase',
      name: 'purchase',
      desc: '',
      args: [],
    );
  }

  /// `Event Date`
  String get eventDate {
    return Intl.message(
      'Event Date',
      name: 'eventDate',
      desc: '',
      args: [],
    );
  }

  /// `Ad Views`
  String get adViews {
    return Intl.message(
      'Ad Views',
      name: 'adViews',
      desc: '',
      args: [],
    );
  }

  /// `Report  this Ad`
  String get reportThisAdd {
    return Intl.message(
      'Report  this Ad',
      name: 'reportThisAdd',
      desc: '',
      args: [],
    );
  }

  /// `Ad Saved`
  String get adSaved {
    return Intl.message(
      'Ad Saved',
      name: 'adSaved',
      desc: '',
      args: [],
    );
  }

  /// `Save this ad`
  String get saveThisAd {
    return Intl.message(
      'Save this ad',
      name: 'saveThisAd',
      desc: '',
      args: [],
    );
  }

  /// `Add your review`
  String get addYourReview {
    return Intl.message(
      'Add your review',
      name: 'addYourReview',
      desc: '',
      args: [],
    );
  }

  /// `User reviews`
  String get userReviews {
    return Intl.message(
      'User reviews',
      name: 'userReviews',
      desc: '',
      args: [],
    );
  }

  /// `Quote`
  String get quote {
    return Intl.message(
      'Quote',
      name: 'quote',
      desc: '',
      args: [],
    );
  }

  /// `Similar Ads `
  String get similarAds {
    return Intl.message(
      'Similar Ads ',
      name: 'similarAds',
      desc: '',
      args: [],
    );
  }

  /// `Place your Quote`
  String get placeYourQuote {
    return Intl.message(
      'Place your Quote',
      name: 'placeYourQuote',
      desc: '',
      args: [],
    );
  }

  /// `Your message`
  String get yourMessage {
    return Intl.message(
      'Your message',
      name: 'yourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Amount`
  String get enterYourAmount {
    return Intl.message(
      'Enter your Amount',
      name: 'enterYourAmount',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Your Reviews`
  String get yourReviews {
    return Intl.message(
      'Your Reviews',
      name: 'yourReviews',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate this product?`
  String get howWouldYouRateThisProduct {
    return Intl.message(
      'How would you rate this product?',
      name: 'howWouldYouRateThisProduct',
      desc: '',
      args: [],
    );
  }

  /// `Submit Review`
  String get submitReview {
    return Intl.message(
      'Submit Review',
      name: 'submitReview',
      desc: '',
      args: [],
    );
  }

  /// `Username of other Person`
  String get useNameOfOtherPerson {
    return Intl.message(
      'Username of other Person',
      name: 'useNameOfOtherPerson',
      desc: '',
      args: [],
    );
  }

  /// `Violation Type`
  String get violationType {
    return Intl.message(
      'Violation Type',
      name: 'violationType',
      desc: '',
      args: [],
    );
  }

  /// `Select Violation Type`
  String get selectViolationType {
    return Intl.message(
      'Select Violation Type',
      name: 'selectViolationType',
      desc: '',
      args: [],
    );
  }

  /// `URL of  Violation`
  String get uRLOfViolation {
    return Intl.message(
      'URL of  Violation',
      name: 'uRLOfViolation',
      desc: '',
      args: [],
    );
  }

  /// `Enter URL`
  String get enterURL {
    return Intl.message(
      'Enter URL',
      name: 'enterURL',
      desc: '',
      args: [],
    );
  }

  /// `Violation Details`
  String get violationDetails {
    return Intl.message(
      'Violation Details',
      name: 'violationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Enter Violation Details`
  String get enterViolationDetails {
    return Intl.message(
      'Enter Violation Details',
      name: 'enterViolationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Report Violation`
  String get reportViolation {
    return Intl.message(
      'Report Violation',
      name: 'reportViolation',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Check out`
  String get checkOut {
    return Intl.message(
      'Check out',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `OrderInfo`
  String get orderInfo {
    return Intl.message(
      'OrderInfo',
      name: 'orderInfo',
      desc: '',
      args: [],
    );
  }

  /// `No Item available`
  String get noItemAvailable {
    return Intl.message(
      'No Item available',
      name: 'noItemAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete ?`
  String get areYouSureYouWantTODelete {
    return Intl.message(
      'Are you sure you want to delete ?',
      name: 'areYouSureYouWantTODelete',
      desc: '',
      args: [],
    );
  }

  /// `Delete Item`
  String get deleteItem {
    return Intl.message(
      'Delete Item',
      name: 'deleteItem',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `My Events`
  String get myEvents {
    return Intl.message(
      'My Events',
      name: 'myEvents',
      desc: '',
      args: [],
    );
  }

  /// `My Trainings`
  String get myTrainings {
    return Intl.message(
      'My Trainings',
      name: 'myTrainings',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get aboutMe {
    return Intl.message(
      'About Me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Select your country`
  String get selectYOurCountry {
    return Intl.message(
      'Select your country',
      name: 'selectYOurCountry',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Enter your facebook profile link`
  String get enterYourFacebookProfileLink {
    return Intl.message(
      'Enter your facebook profile link',
      name: 'enterYourFacebookProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pinterest profile link`
  String get enterYourPinterestProfileLink {
    return Intl.message(
      'Enter your pinterest profile link',
      name: 'enterYourPinterestProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your twitter profile link`
  String get enterYourTwitterProfileLink {
    return Intl.message(
      'Enter your twitter profile link',
      name: 'enterYourTwitterProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your instagram profile link`
  String get enterYourInstagramProfileLink {
    return Intl.message(
      'Enter your instagram profile link',
      name: 'enterYourInstagramProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your linkedin profile link`
  String get enterYourLinkedinProfileLink {
    return Intl.message(
      'Enter your linkedin profile link',
      name: 'enterYourLinkedinProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your youtube profile link`
  String get enterYourYoutubeProfileLink {
    return Intl.message(
      'Enter your youtube profile link',
      name: 'enterYourYoutubeProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Website URL`
  String get enterYourYourWebsiteURL {
    return Intl.message(
      'Enter your Website URL',
      name: 'enterYourYourWebsiteURL',
      desc: '',
      args: [],
    );
  }

  /// `Pinterest`
  String get pinterest {
    return Intl.message(
      'Pinterest',
      name: 'pinterest',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get twitter {
    return Intl.message(
      'Twitter',
      name: 'twitter',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message(
      'Instagram',
      name: 'instagram',
      desc: '',
      args: [],
    );
  }

  /// `Linkedin`
  String get linkedin {
    return Intl.message(
      'Linkedin',
      name: 'linkedin',
      desc: '',
      args: [],
    );
  }

  /// `Youtube`
  String get youtube {
    return Intl.message(
      'Youtube',
      name: 'youtube',
      desc: '',
      args: [],
    );
  }

  /// `Website URL`
  String get websiteUrl {
    return Intl.message(
      'Website URL',
      name: 'websiteUrl',
      desc: '',
      args: [],
    );
  }

  /// `Continue to Chat`
  String get continueToChat {
    return Intl.message(
      'Continue to Chat',
      name: 'continueToChat',
      desc: '',
      args: [],
    );
  }

  /// `Tips for a Safe Deal`
  String get tipsForASafeDeal {
    return Intl.message(
      'Tips for a Safe Deal',
      name: 'tipsForASafeDeal',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t listed anything yet`
  String get youHaveNotListedAnythingYet {
    return Intl.message(
      'You haven’t listed anything yet',
      name: 'youHaveNotListedAnythingYet',
      desc: '',
      args: [],
    );
  }

  /// `months ago`
  String get monthsAgo {
    return Intl.message(
      'months ago',
      name: 'monthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `Favourite Ads`
  String get favouriteAds {
    return Intl.message(
      'Favourite Ads',
      name: 'favouriteAds',
      desc: '',
      args: [],
    );
  }

  /// `Pending Ads`
  String get pendingAds {
    return Intl.message(
      'Pending Ads',
      name: 'pendingAds',
      desc: '',
      args: [],
    );
  }

  /// `Expired Ads`
  String get expiredAds {
    return Intl.message(
      'Expired Ads',
      name: 'expiredAds',
      desc: '',
      args: [],
    );
  }

  /// `Delete Post`
  String get deletePost {
    return Intl.message(
      'Delete Post',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }

  /// `No user Found`
  String get noUserFound {
    return Intl.message(
      'No user Found',
      name: 'noUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Invalid chat url.`
  String get invalidChatURL {
    return Intl.message(
      'Invalid chat url.',
      name: 'invalidChatURL',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Ticket List`
  String get ticketList {
    return Intl.message(
      'Ticket List',
      name: 'ticketList',
      desc: '',
      args: [],
    );
  }

  /// `Authorise Payment`
  String get authorisePayment {
    return Intl.message(
      'Authorise Payment',
      name: 'authorisePayment',
      desc: '',
      args: [],
    );
  }

  /// `Available Quantity :`
  String get availableQuantity {
    return Intl.message(
      'Available Quantity :',
      name: 'availableQuantity',
      desc: '',
      args: [],
    );
  }

  /// `All Events`
  String get allEvent {
    return Intl.message(
      'All Events',
      name: 'allEvent',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Tag.`
  String get pleaseEnterTag {
    return Intl.message(
      'Please Enter Tag.',
      name: 'pleaseEnterTag',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Location.`
  String get pleaseSelectLocation {
    return Intl.message(
      'Please Select Location.',
      name: 'pleaseSelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Expire Days.`
  String get pleaseSelectExpireDays {
    return Intl.message(
      'Please Select Expire Days.',
      name: 'pleaseSelectExpireDays',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Seller Name.`
  String get pleaseEnterSellerName {
    return Intl.message(
      'Please Enter Seller Name.',
      name: 'pleaseEnterSellerName',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Ago`
  String get ago {
    return Intl.message(
      'Ago',
      name: 'ago',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `Negotiate`
  String get negotiate {
    return Intl.message(
      'Negotiate',
      name: 'negotiate',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get addReview {
    return Intl.message(
      'Add Review',
      name: 'addReview',
      desc: '',
      args: [],
    );
  }

  /// `No similar ads`
  String get noSimilarAds {
    return Intl.message(
      'No similar ads',
      name: 'noSimilarAds',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Go to your email`
  String get goToYourEmail {
    return Intl.message(
      'Go to your email',
      name: 'goToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `verify your email address.`
  String get verifyYourEmailAddress {
    return Intl.message(
      'verify your email address.',
      name: 'verifyYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resendEmail {
    return Intl.message(
      'Resend Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Address`
  String get enterYourAddress {
    return Intl.message(
      'Enter Your Address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Send Mail`
  String get sendMail {
    return Intl.message(
      'Send Mail',
      name: 'sendMail',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get enterYourName {
    return Intl.message(
      'Enter Your Name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Your Name*`
  String get yourName {
    return Intl.message(
      'Your Name*',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Title for your training`
  String get titleForYourTraining {
    return Intl.message(
      'Title for your training',
      name: 'titleForYourTraining',
      desc: '',
      args: [],
    );
  }

  /// `Tell us more about your description`
  String get tellUsMoreAboutYourDescription {
    return Intl.message(
      'Tell us more about your description',
      name: 'tellUsMoreAboutYourDescription',
      desc: '',
      args: [],
    );
  }

  /// `Video Gallery`
  String get videoGallery {
    return Intl.message(
      'Video Gallery',
      name: 'videoGallery',
      desc: '',
      args: [],
    );
  }

  /// `Download completed`
  String get downloadCompleted {
    return Intl.message(
      'Download completed',
      name: 'downloadCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get Open {
    return Intl.message(
      'Open',
      name: 'Open',
      desc: '',
      args: [],
    );
  }

  /// `All Training`
  String get allTraining {
    return Intl.message(
      'All Training',
      name: 'allTraining',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Detail`
  String get transactionDetail {
    return Intl.message(
      'Transaction Detail',
      name: 'transactionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `No Transaction Found`
  String get noTransactionFound {
    return Intl.message(
      'No Transaction Found',
      name: 'noTransactionFound',
      desc: '',
      args: [],
    );
  }

  /// `Exp.`
  String get exp {
    return Intl.message(
      'Exp.',
      name: 'exp',
      desc: '',
      args: [],
    );
  }

  /// `Upload Video`
  String get uploadVideo {
    return Intl.message(
      'Upload Video',
      name: 'uploadVideo',
      desc: '',
      args: [],
    );
  }

  /// `Upload Images`
  String get uploadImages {
    return Intl.message(
      'Upload Images',
      name: 'uploadImages',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter New Password`
  String get pleaseEnterNewPassword {
    return Intl.message(
      'Please Enter New Password',
      name: 'pleaseEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload Images.`
  String get pleaseUploadImages {
    return Intl.message(
      'Please Upload Images.',
      name: 'pleaseUploadImages',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get enterYourNewPassword {
    return Intl.message(
      'Enter Your New Password',
      name: 'enterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Mobile Number`
  String get PleaseEnterYourMobileNumber {
    return Intl.message(
      'Please Enter Your Mobile Number',
      name: 'PleaseEnterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter 6 Digit Otp`
  String get pleaseEnterSixDigitOTP {
    return Intl.message(
      'Please Enter 6 Digit Otp',
      name: 'pleaseEnterSixDigitOTP',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Confirm Password`
  String get pleaseEnterConfirmPassword {
    return Intl.message(
      'Please Enter Confirm Password',
      name: 'pleaseEnterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password Not Matched.`
  String get confirmPasswordNotMatched {
    return Intl.message(
      'Confirm Password Not Matched.',
      name: 'confirmPasswordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Email.`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please Enter Email.',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Mobile Number`
  String get pleaseEnterMobileNumber {
    return Intl.message(
      'Please Enter Mobile Number',
      name: 'pleaseEnterMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Email.`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please Enter Valid Email.',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password.`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please Enter Password.',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Full Name.`
  String get pleaseEnterYourFullName {
    return Intl.message(
      'Please Enter Your Full Name.',
      name: 'pleaseEnterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Username.`
  String get pleaseEnterYourUsername {
    return Intl.message(
      'Please Enter Your Username.',
      name: 'pleaseEnterYourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Phone Number.`
  String get pleaseEnterYourPhoneNumber {
    return Intl.message(
      'Please Enter Your Phone Number.',
      name: 'pleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Select ID Proof Type.`
  String get pleaseSelectIDProofType {
    return Intl.message(
      'Please Select ID Proof Type.',
      name: 'pleaseSelectIDProofType',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter ID Proof Number.`
  String get pleaseEnterIDProofNumber {
    return Intl.message(
      'Please Enter ID Proof Number.',
      name: 'pleaseEnterIDProofNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload ID Proof Image.`
  String get pleaseUploadIDProofImage {
    return Intl.message(
      'Please Upload ID Proof Image.',
      name: 'pleaseUploadIDProofImage',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Title.`
  String get pleaseEnterTitle {
    return Intl.message(
      'Please Enter Title.',
      name: 'pleaseEnterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Description.`
  String get pleaseEnterDescription {
    return Intl.message(
      'Please Enter Description.',
      name: 'pleaseEnterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Date.`
  String get pleaseSelectDate {
    return Intl.message(
      'Please Select Date.',
      name: 'pleaseSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Time.`
  String get pleaseSelectTime {
    return Intl.message(
      'Please Select Time.',
      name: 'pleaseSelectTime',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload Promo Image.`
  String get pleaseUploadPromoImage {
    return Intl.message(
      'Please Upload Promo Image.',
      name: 'pleaseUploadPromoImage',
      desc: '',
      args: [],
    );
  }

  /// `Please Upload Promo Video.`
  String get pleaseUploadPromoVideo {
    return Intl.message(
      'Please Upload Promo Video.',
      name: 'pleaseUploadPromoVideo',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Ticket Title.`
  String get pleaseEnterTicketTitle {
    return Intl.message(
      'Please Enter Ticket Title.',
      name: 'pleaseEnterTicketTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Ticket Quantity.`
  String get pleaseEnterTicketQuantity {
    return Intl.message(
      'Please Enter Ticket Quantity.',
      name: 'pleaseEnterTicketQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Ticket Price.`
  String get pleaseEnterTicketPrice {
    return Intl.message(
      'Please Enter Ticket Price.',
      name: 'pleaseEnterTicketPrice',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Selling Mode.`
  String get pleaseSelectSellingMode {
    return Intl.message(
      'Please Select Selling Mode.',
      name: 'pleaseSelectSellingMode',
      desc: '',
      args: [],
    );
  }

  /// `Ticked Added.`
  String get tickedAdded {
    return Intl.message(
      'Ticked Added.',
      name: 'tickedAdded',
      desc: '',
      args: [],
    );
  }

  /// `Ticked Removed Successfully.`
  String get tickedRemovedSuccessfully {
    return Intl.message(
      'Ticked Removed Successfully.',
      name: 'tickedRemovedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please Create Ticket.`
  String get pleaseCreateTicket {
    return Intl.message(
      'Please Create Ticket.',
      name: 'pleaseCreateTicket',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Add Type.`
  String get pleaseSelectAddType {
    return Intl.message(
      'Please Select Add Type.',
      name: 'pleaseSelectAddType',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Premium Type.`
  String get pleaseSelectPremiumType {
    return Intl.message(
      'Please Select Premium Type.',
      name: 'pleaseSelectPremiumType',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Price.`
  String get pleaseEnterPrice {
    return Intl.message(
      'Please Enter Price.',
      name: 'pleaseEnterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Log In to Save This Ad`
  String get logInToSaveThisAd {
    return Intl.message(
      'Log In to Save This Ad',
      name: 'logInToSaveThisAd',
      desc: '',
      args: [],
    );
  }

  /// `You Can Not Quote On Your Own Post.`
  String get youCanNotQuoteOnYourOwnPost {
    return Intl.message(
      'You Can Not Quote On Your Own Post.',
      name: 'youCanNotQuoteOnYourOwnPost',
      desc: '',
      args: [],
    );
  }

  /// `Log In to chat or send quote`
  String get logInToChatOrSendQuote {
    return Intl.message(
      'Log In to chat or send quote',
      name: 'logInToChatOrSendQuote',
      desc: '',
      args: [],
    );
  }

  /// `You cannot Chat On Your Own Post.`
  String get youCanNotChatOnYourOwnPost {
    return Intl.message(
      'You cannot Chat On Your Own Post.',
      name: 'youCanNotChatOnYourOwnPost',
      desc: '',
      args: [],
    );
  }

  /// `Please log In first for chat`
  String get pleaseLogInFirstForChat {
    return Intl.message(
      'Please log In first for chat',
      name: 'pleaseLogInFirstForChat',
      desc: '',
      args: [],
    );
  }

  /// `No User Reviews`
  String get noUserReviews {
    return Intl.message(
      'No User Reviews',
      name: 'noUserReviews',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Facebook Link.`
  String get pleaseEnterValidFacebookLink {
    return Intl.message(
      'Please Enter Valid Facebook Link.',
      name: 'pleaseEnterValidFacebookLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Pinterest Profile Link.`
  String get pleaseEnterValidPinterestProfileLink {
    return Intl.message(
      'Please Enter Valid Pinterest Profile Link.',
      name: 'pleaseEnterValidPinterestProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Twitter Profile Link.`
  String get pleaseEnterValidTwitterProfileLink {
    return Intl.message(
      'Please Enter Valid Twitter Profile Link.',
      name: 'pleaseEnterValidTwitterProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Instagram Link.`
  String get pleaseEnterValidInstagramLink {
    return Intl.message(
      'Please Enter Valid Instagram Link.',
      name: 'pleaseEnterValidInstagramLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Linkedin Profile Link.`
  String get pleaseEnterValidLinkedinProfileLink {
    return Intl.message(
      'Please Enter Valid Linkedin Profile Link.',
      name: 'pleaseEnterValidLinkedinProfileLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Youtube Link.`
  String get pleaseEnterValidYoutubeLink {
    return Intl.message(
      'Please Enter Valid Youtube Link.',
      name: 'pleaseEnterValidYoutubeLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Website URL.`
  String get pleaseEnterValidWebsiteURL {
    return Intl.message(
      'Please Enter Valid Website URL.',
      name: 'pleaseEnterValidWebsiteURL',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Reviews.`
  String get pleaseEnterYourReviews {
    return Intl.message(
      'Please Enter Your Reviews.',
      name: 'pleaseEnterYourReviews',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Amount.`
  String get pleaseEnterAmount {
    return Intl.message(
      'Please Enter Amount.',
      name: 'pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Message.`
  String get pleaseEnterMessage {
    return Intl.message(
      'Please Enter Message.',
      name: 'pleaseEnterMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send Mail To `
  String get sendMailTo {
    return Intl.message(
      'Send Mail To ',
      name: 'sendMailTo',
      desc: '',
      args: [],
    );
  }

  /// `Send Mail To Please Select Violation Type.`
  String get pleaseSelectViolationType {
    return Intl.message(
      'Send Mail To Please Select Violation Type.',
      name: 'pleaseSelectViolationType',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Violation Details`
  String get pleaseEnterViolationDetails {
    return Intl.message(
      'Please Enter Violation Details',
      name: 'pleaseEnterViolationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Valid Link.`
  String get pleaseEnterValidLink {
    return Intl.message(
      'Please Enter Valid Link.',
      name: 'pleaseEnterValidLink',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Name.`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please Enter Your Name.',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Price From Value`
  String get pleaseEnterPriceFromValue {
    return Intl.message(
      'Please Enter Price From Value',
      name: 'pleaseEnterPriceFromValue',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Short By`
  String get pleaseSelectShortBy {
    return Intl.message(
      'Please Select Short By',
      name: 'pleaseSelectShortBy',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill Up At Least One Field.`
  String get pleaseFillUpAtLeastOneField {
    return Intl.message(
      'Please Fill Up At Least One Field.',
      name: 'pleaseFillUpAtLeastOneField',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Please wait...`
  String get pleaseWait {
    return Intl.message(
      'Please wait...',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Please wait while authorising...`
  String get pleaseWaitWhileAuthorising {
    return Intl.message(
      'Please wait while authorising...',
      name: 'pleaseWaitWhileAuthorising',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Images.`
  String get pleaseSelectImages {
    return Intl.message(
      'Please Select Images.',
      name: 'pleaseSelectImages',
      desc: '',
      args: [],
    );
  }

  /// `Purchased`
  String get purchased {
    return Intl.message(
      'Purchased',
      name: 'purchased',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get transactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
