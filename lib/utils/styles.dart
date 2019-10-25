import 'package:flutter/material.dart';

// basic colors
const kTeal50 = Color(0xFFE0F2F1);
const kTeal100 = Color(0xFF3FC1BE);

const kDefaultBackgroundAvatar = '3FC1BE';
const kDefaultTextColorAvatar = 'EEEEEE';
const kDefaultAdminBackgroundAvatar = 'EEEEEE';
const kDefaultAdminTextColorAvatar = '3FC1BE';

const kTeal400 = Color(0xFF26A69A);

const kGrey600 = Color(0xFF546E7A);
const kGrey200 = Color(0xFFEEEEEE);
const kGrey400 = Color(0xFF90a4ae);
const kErrorRed = Color(0xFFe74c3c);
const kBackgroundWhite = Colors.white;

// colors for theme
const kLightPrimary = Color(0xfffcfcff);
const kLightAccent = Color(0xFF546E7A);
const kDarkAccent = Color(0xffF4F5F5);

const kLightBG = Color(0xffF1F2F3);
const kDarkBG = Color(0xff121212);
const kDarkBgLight = Color(0xff1E1E1E);
const kBadgeColor = Colors.red;

//colors
const Color kPrimaryColor = Color(0xFFb5cea8);
const Color kPrimaryLightColor = Color(0xFFe7ffda);
const Color kPrimaryDarkColor = Color(0xFF859d79);
const Color kPrimaryTextColor = Color(0xFF000000);

const Color kSecondaryColor = Color(0xFFce9f5d);
const Color kSecondaryLightColor = Color(0xFFffd08b);
const Color kSecondaryDarkColor = Color(0xFF9a7131);
const Color kSecondaryTextColor = Color(0xFF000000);

const Color kBackgroundColor = Color(0xffe6e6e6);
const Color kSurfaceWhite = Color(0xFFFFFBFA);
const Color kErrorColor = Color(0xffff8888);
const Color kGrey900 = Color(0xFF263238);
const Color kGold = Color(0xFFCe9f5d);

const Color kFacebookColor = Color.fromRGBO(107, 112, 248, 1);

const Color kInfoBgLightColor = Color(0xfffff8e1); //Colors.amber[50]
const Color kInfoBgDarkColor = Color(0xffffb300); //Colors.amber[600]


const ColorScheme kColorScheme = ColorScheme(
  primary: kPrimaryColor,
  primaryVariant: kGrey900,
  secondary: kSecondaryColor,
  secondaryVariant: kGrey900,
  surface: kSurfaceWhite,
  background: kBackgroundWhite,
  error: kErrorColor,
  onPrimary: kGrey900,
  onSecondary: kGrey900,
  onSurface: kGrey900,
  onBackground: kGrey900,
  onError: kSurfaceWhite,
  brightness: Brightness.light,
);

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kGrey900);
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline
            .copyWith(fontWeight: FontWeight.w500, color: Colors.red),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Raleway',
        displayColor: kGrey900,
        bodyColor: kGrey900,
      )
      .copyWith(
        headline: base.headline.copyWith(fontFamily: 'Roboto'),
        caption:  base.headline.copyWith(fontFamily: 'Raleway'),
        title: base.headline.copyWith(fontFamily: 'Raleway'),
        );
}

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: kColorScheme,
    buttonColor: kSecondaryLightColor,
    cardColor: Colors.white,
    textSelectionColor: kTeal100,
    errorColor: kErrorColor,
    buttonTheme: const ButtonThemeData(
      colorScheme: kColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryColorLight: kPrimaryLightColor,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    backgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryColor,
    cursorColor: kSecondaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        title: TextStyle(
          color: kGrey900,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
    ),
  );
}