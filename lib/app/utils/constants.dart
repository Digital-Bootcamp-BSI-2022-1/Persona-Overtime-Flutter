import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Colors
const kPrimaryRed = Color(0xFFCA000E);
const kPrimaryBlack = Color(0xFF000000);
const kPrimaryWhite = Color(0xFFFFFFFF);
const kPrimaryBlue = Color(0xFF0582AE);
const kPrimaryDarkBlue = Color(0xFF02394D);
const kPrimaryGrey = Color(0xFF8C8C8C);
const kPrimaryBlueGreen = Color(0xFF2AA9B8);
const kPrimaryPurple = Color(0xFF68A5FE);
const kPrimaryYellow = Color(0xFFF6BF6D);
const kPrimaryGreen = Colors.green;
const kBackgroundWhite = Color(0xFFFAFAFA);
const kBackgroundBlue = Color(0xFF21ACD7);
const kBlurGrey = Color.fromARGB(125, 0, 0, 0);

// TextStyle
const _kCommonTextStyle = TextStyle(
  fontFamily: 'MMC',
  color: kPrimaryBlack,
);
final kTextStyleTitle = _kCommonTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold);

// Format
var formatTime = DateFormat('HH:mm:ss');
var formatDate = DateFormat('EEEE, LLLL dd, yyyy');
var formatDateOvertimeReq = DateFormat('LLLL dd, yyyy');
var formatDateMdy = DateFormat('LLL dd, yyyy');
var formatDatedd = DateFormat('dd');
var formatDateLLL = DateFormat('LLL');
var formatDay = DateFormat('EEEE');
