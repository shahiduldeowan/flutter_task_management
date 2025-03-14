import "package:flutter/material.dart";

class AdaptiveCircularProgressIndicator extends StatelessWidget {
  const AdaptiveCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
