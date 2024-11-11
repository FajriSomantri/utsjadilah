import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onGoogleLogin;
  final VoidCallback onFacebookLogin;

  const SocialLoginButtons({
    super.key,
    required this.onGoogleLogin,
    required this.onFacebookLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Continue with Google',
          onPressed: onGoogleLogin,
          backgroundColor: Colors.white,
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Continue with Facebook',
          onPressed: onFacebookLogin,
          backgroundColor: const Color(0xFF1877F2),
        ),
      ],
    );
  }
}