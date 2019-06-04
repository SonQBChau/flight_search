
import 'package:flight_search/widgets/animated_plan_icon.dart';
import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  final double height;

  const PriceTab({Key key, this.height}) : super(key: key);

  @override
  _PriceTabState createState() => _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;

  AnimationController _planeSizeAnimationController;
  AnimationController _planeTravelController;
  Animation _planeSizeAnimation;
  Animation _planeTravelAnimation;

  double get _planeTopPadding =>
      _minPlanePaddingTop +
          (1 - _planeTravelAnimation.value) * _maxPlaneTopPadding;

  double get _maxPlaneTopPadding =>
      widget.height - _initialPlanePaddingBottom - _planeSize;

  double get _planeSize => _planeSizeAnimation.value;

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500),
                () => _planeTravelController.forward());
      }
    });
    _planeSizeAnimation = Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _planeSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }

  _initPlaneTravelAnimations() {
    _planeTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _planeTravelAnimation = CurvedAnimation(
      parent: _planeTravelController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
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
    return AnimatedBuilder(
      animation: _planeTravelAnimation,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(animation: _planeSizeAnimation),
        ],
      ),
      builder: (context, child) => Positioned(
        top: _planeTopPadding,
        child: child,
      ),
    );
  }

}