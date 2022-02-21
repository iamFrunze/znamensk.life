import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znamensk/helpers/dialog_error.dart';
import 'package:znamensk/presentation/home/home_screen.dart';
import 'package:znamensk/presentation/splash/bloc/splash_bloc.dart';
import 'package:znamensk/resources/images/apllication_images.dart';
import 'package:znamensk/resources/strings/splash_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(SplashLoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final splashBloc = BlocProvider.of<SplashBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: BlocListener(
          bloc: BlocProvider.of<SplashBloc>(context),
          listener: (context, state) {
            if (state is SplashLoadSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ),
              );
            }
            if (state is SplashLoadErrorState) {
              showError(
                context,
                SplashStrings.shared.title(state.code),
                state.error,
                SplashStrings.shared.allow,
              );
            }
          },
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              return DropShadowImage(
                image: Image.asset(
                  ApplicationImages.shared.logoWithoutBackground,
                ),
                borderRadius: 20,
                blurRadius: 20,
                offset: const Offset(5, 5),
                scale: 1.05,
              );
            },
          ),
        ),
      ),
    );
  }
}
