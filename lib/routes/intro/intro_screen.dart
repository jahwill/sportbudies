import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 5), () {
        context.pushOff(const LogInScreen());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return Scaffold(
      backgroundColor: theme.background,
      body: Container(
        height: context.heightPx,
        width: context.widthPx,
        decoration: BoxDecoration(
          color: theme.background,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassText(
                text: 'Sport Buddy',
                fontSize: 12,
                color: theme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GlassText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  GlassText({required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.red, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ).createShader(bounds),
          blendMode: BlendMode.srcATop,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
