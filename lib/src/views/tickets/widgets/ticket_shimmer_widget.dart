import 'package:flutter/material.dart';
import 'package:cdp_team_support_sdk/src/config/support_sdk_config.dart';
import 'package:cdp_team_support_sdk/src/theme/sdk_colors.dart';

class TicketShimmerWidget extends StatefulWidget {
  const TicketShimmerWidget({super.key});

  @override
  State<TicketShimmerWidget> createState() => _TicketShimmerWidgetState();
}

class _TicketShimmerWidgetState extends State<TicketShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final bool isTab = SupportSdkConfig.instance.isTablet;
    return AnimatedBuilder(
      animation: _animation,
      builder: (final BuildContext context, final Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List<Widget>.generate(
                    5,
                    (final int index) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _ShimmerBox(
                        width: isTab ? 170 : 140,
                        height: isTab ? 120 : 100,
                        opacity: _animation.value,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ...List<Widget>.generate(
                5,
                (final int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _ShimmerBox(
                    width: double.infinity,
                    height: isTab ? 60 : 100,
                    opacity: _animation.value,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;

  const _ShimmerBox({
    required this.width,
    required this.height,
    required this.opacity,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: SdkColors.homeBorder.withValues(alpha: 0.4 + (opacity * 0.4)),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: SdkColors.homeBorder.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
    );
  }
}
