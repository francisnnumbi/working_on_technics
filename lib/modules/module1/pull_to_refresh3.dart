import 'package:flutter/material.dart';

class PullToRefreshController3 extends ChangeNotifier {
  bool isRefreshing = false;

  bool onRefreshing() {
    isRefreshing = true;
    notifyListeners();
    return true;
  }

  void onLoaded() {
    isRefreshing = false;
    notifyListeners();
  }
}

class PullToRefresh3 extends StatefulWidget {
  const PullToRefresh3({
    Key? key,
    this.header,
    this.child,
    this.maxHeight = 150.0,
    this.onRefresh,
    this.onLoaded,
    this.controller,
  }) : super(key: key);
  final Widget? header;
  final Widget? child;
  final Future<bool> Function()? onRefresh;
  final Function? onLoaded;

  final double maxHeight;

  final PullToRefreshController3? controller;

  @override
  _PullToRefresh3State createState() => _PullToRefresh3State();
}

class _PullToRefresh3State extends State<PullToRefresh3> {
  double _y0 = 0.0;
  double _y1 = 0.0;
  double _yt = 0.0;
  double _ym = 0.0;
  bool _isRefreshing = false;
  final Duration _duration = const Duration(microseconds: 500);

  @override
  initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (widget.controller!.isRefreshing) {
          _isRefreshing = true;
          _y0 = 0.0;
          _y1 = 0.0;
          _yt = 0.0;
          _ym = 0.0;
        } else {
          _isRefreshing = false;
          slapBack();
        }
      });
    }
  }

  slapBack() async {
    while (_yt > 1) {
      _yt -= 1;
      setState(() {});
      await Future.delayed(_duration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    _y0 = notification.dragDetails?.globalPosition.dy ?? 0.0;
                  }
                  if (notification is OverscrollNotification) {
                    try {
                      _y1 = notification.dragDetails?.globalPosition.dy ?? 0.0;

                      setState(() {
                        _yt = _y1 < _y0 ? 0 : _y1 - _y0;
                        if (_yt > widget.maxHeight) _yt = widget.maxHeight;
                        _ym = _yt * 0.1;
                      });
                    } on Exception catch (e) {
                      // TODO
                    }
                  }
                  if (notification is ScrollEndNotification) {
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
    );
  }
}
