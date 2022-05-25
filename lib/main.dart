import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:starhovanie/internal/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  runApp(const Application());
  await DesktopWindow.setWindowSize(Size(450, 900));
  await DesktopWindow.setMinWindowSize(Size(450, 900));
  await DesktopWindow.setMaxWindowSize(Size(450, 900));
}
