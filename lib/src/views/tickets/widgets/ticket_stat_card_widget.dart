import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class TicketStatCard extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;
  final Color accentColor;
  final int index;

  const TicketStatCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    required this.accentColor,
    this.index = 0,
  });

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 400 + (index * 80)),
      curve: Curves.easeOutCubic,
      builder: (final BuildContext context, final double value,
          final Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 16 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTab ? 12 : 8,
          vertical: isTab ? 12 : 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: SdkColors.homeBorder, width: 1),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: SdkColors.homeShadow,
              blurRadius: 8,
              spreadRadius: -2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: isTab ? 38 : 32,
              height: isTab ? 38 : 32,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: accentColor,
                size: isTab ? 18 : 15,
              ),
            ),
            SizedBox(height: isTab ? 6 : 4),
            Text(
              '$count',
              style: sdkRubikW700(isTablet: isTab).copyWith(
                fontSize: isTab ? 22 : 18,
                color: SdkColors.splashDeep,
                height: 1.1,
              ),
            ),
            SizedBox(height: isTab ? 3 : 2),
            Text(
              label,
              style: sdkRubikW500(isTablet: isTab).copyWith(
                fontSize: isTab ? 9 : 8,
                color: SdkColors.homeSubtext,
                letterSpacing: 0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              width: 20,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
