import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/color_constants.dart';
import '../../view_models/loading_view_model.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingViewModel>(
      builder: (context, loadingProvider, _) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (loadingProvider.isLoading)
              Container(
                decoration: BoxDecoration(
                  color: black.withOpacity(0.5),
                ),
                child: const Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(primaryColor))),
              )
          ],
        );
      },
    );
  }
}
