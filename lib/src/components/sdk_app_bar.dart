import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_fonts.dart';

class SdkAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? actionWidget;

  const SdkAppBar({super.key, required this.title, this.actionWidget});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = SupportSdkConfig.instance.isTablet;
    final double topPadding = MediaQuery.of(context).padding.top;

    return Stack(
      children: <Widget>[
        Container(
          height: topPadding + (isTablet ? 65 : 50),
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: SdkColors.splashDeep.withValues(alpha: 0.07),
                blurRadius: 12,
                spreadRadius: -2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isTablet ? 80 : 60),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: sdkRubikW700(isTablet: isTablet).copyWith(
                    color: SdkColors.splashDeep,
                    fontSize: isTablet ? 20 : 17,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: isTablet ? 40 : 34,
                      height: isTablet ? 40 : 34,
                      decoration: BoxDecoration(
                        color: SdkColors.splashDeep.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: SdkColors.splashDeep,
                        size: isTablet ? 20 : 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (actionWidget != null)
                    actionWidget!
                  else
                    SizedBox(width: isTablet ? 48 : 42),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  SdkColors.primaryColor.withValues(alpha: 0.65),
                  SdkColors.secondaryColor.withValues(alpha: 0.80),
                  SdkColors.splashGlowBright.withValues(alpha: 0.90),
                  SdkColors.splashGold.withValues(alpha: 0.80),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
