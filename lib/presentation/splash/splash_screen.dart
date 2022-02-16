import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znamensk/presentation/splash/bloc/splash_bloc.dart';
import 'package:znamensk/resources/images/apllication_images.dart';

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
  Widget build(BuildContext context) {
    final splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(SplashLoadDataEvent());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashLoadSuccessState) {
              // TODO navigate with success data
            }
            if (state is SplashLoadErrorState) {
              // TODO Navigate with error data
            }
            return DropShadowImage(
              image:
                  Image.asset(ApplicationImages.shared.logoWithoutBackground),
              borderRadius: 20,
              blurRadius: 20,
              offset: const Offset(5, 5),
              scale: 1.05,
            );
          },
        ),
      ),
    );
  }
}
