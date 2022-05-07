import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PullToRefresh2 extends StatefulWidget {
  const PullToRefresh2({
    Key? key,
    this.header,
    this.child,
    this.maxHeight = 250.0,
    this.onRefresh,
    this.onLoaded,
  }) : super(key: key);
  final Widget? header;
  final Widget? child;
  final Future<bool> Function()? onRefresh;
  final Function? onLoaded;

  final double maxHeight;

  @override
  _PullToRefresh2State createState() => _PullToRefresh2State();
}

class _PullToRefresh2State extends State<PullToRefresh2> {
  double _y0 = 0.0;
  double _y1 = 0.0;
  double _yt = 0.0;
  double _ym = 0.0;
  bool _isRefreshing = false;
  final Duration _duration = const Duration(microseconds: 500);

  slapBack() async {
    _isRefreshing = true;
    if (widget.onRefresh != null) await widget.onRefresh!();
    _isRefreshing = false;
    while (_yt > 1) {
      if (!_isRefreshing) _yt -= 1;
      if (_yt < 2) if (widget.onLoaded != null) widget.onLoaded!();
      setState(() {});
      await Future.delayed(_duration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      dragStartBehavior: DragStartBehavior.start,
      onVerticalDragDown: (details) {
        _y0 = details.globalPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        _y1 = details.globalPosition.dy;
        setState(() {
          _yt = _y1 < _y0 ? 0 : _y1 - _y0;
          if (_yt > widget.maxHeight) _yt = widget.maxHeight;
          _ym = _yt * 0.1;
        });
      },
      onVerticalDragEnd: (details) {
        if (_y0 < _y1) slapBack();
      },
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox.expand(
              child: NotificationListener(
                  child: widget.child!,
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification) {
                      _y0 = notification.metrics.pixels;
                      log("ScrollStartNotification : ${notification.metrics.extentAfter}");
                    }
                    if (notification is ScrollUpdateNotification) {
                      _y1 = notification.metrics.pixels;
                      log("ScrollUpdateNotification : $_y1");
                      setState(() {
                        _yt = _y1 < _y0 ? 0 : _y1 - _y0;
                        if (_yt > widget.maxHeight) _yt = widget.maxHeight;
                        _ym = _yt * 0.1;
                      });
                    }
                    if (notification is ScrollEndNotification) {
                      log("ScrollEndNotification");
                      if (_y0 < _y1) slapBack();
                    }
                    return false;
                  }),
            ),
          ),
          if (_y1 > _y0 && _yt > _ym)
            Positioned(
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: _duration,
                      curve: Curves.bounceInOut,
                      height: _yt,
                      child: widget.header ??
                          const Center(
                              child: CircularProgressIndicator.adaptive()),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
            ),
        ],
      ),
    );
  }
}
