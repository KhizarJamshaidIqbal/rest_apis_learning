import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: GoogleFonts.cabin(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(text),
          ],
          onTap: () {
            if (kDebugMode) {
              print("Tap Event");
            }
          },
        ),
      ),
    );
  }
}
