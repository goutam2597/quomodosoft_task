import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quomodosoft_task/app/assets_path.dart';
import '../../../../app/app_colors.dart';

/// Reusable widget for displaying social login buttons with SVG logos (Google and Facebook).
class SocialLoginWidget extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;

  const SocialLoginWidget({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Google login button
        Expanded(
          child: _buildSocialButton(
            iconAsset: AssetsPath.googleIcon,
            label: " Google",
            onPressed: onGoogleTap,
          ),
        ),
        const SizedBox(width: 16),

        // Facebook login button
        Expanded(
          child: _buildSocialButton(
            iconAsset: AssetsPath.facebookIcon,
            label: " Facebook",
            onPressed: onFacebookTap,
          ),
        ),
      ],
    );
  }

  /// Social login button with SVG icon and text label
  Widget _buildSocialButton({
    required String iconAsset,
    required String label,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconAsset,
        height: 24,
        width: 24,
      ),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.fillColor2,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide.none,
      ),
    );
  }
}
