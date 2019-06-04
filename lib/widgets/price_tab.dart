
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  final double height;

  const PriceTab({Key key, this.height}) : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  AnimationController _planeSizeAnimationController;
  Animation _planeSizeAnimation;

  double get _planeTopPadding => widget.height - _initialPlanePaddingBottom - _planeSize;

  double get _planeSize => _planeSizeAnimation.value;

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    );
    _planeSizeAnimation = Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _planeSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _planeSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[_buildPlane()],
      ),
    );
  }

  Widget _buildPlane() {
    return Positioned(
      top: _planeTopPadding,
      child: Column(
        children: <Widget>[
          _buildPlaneIcon(),
        ],
      ),
    );
  }

  Widget _buildPlaneIcon() {
    return Icon(
      Icons.airplanemode_active,
      color: Colors.red,
      size: _planeSize,
    );
  }
}