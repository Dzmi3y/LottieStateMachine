import 'package:flutter/material.dart';
import 'package:kot_rahvalod/core/utils/lottie_state_machine/lottie_animation_state.dart';

class LottieStateMachineWidget<T extends Enum> extends StatefulWidget {
  final LottieAnimationData<T> data;
  final T currentStateId;
  final Function(T finishedState)? onAnimationFinished;
  final double? width;
  final double? height;

  const LottieStateMachineWidget({
    super.key,
    required this.data,
    required this.currentStateId,
    this.onAnimationFinished,
    this.width,
    this.height,
  });

  @override
  State<LottieStateMachineWidget<T>> createState() =>
      _LottieStateMachineWidgetState<T>();
}

class _LottieStateMachineWidgetState<T extends Enum>
    extends State<LottieStateMachineWidget<T>>
    with TickerProviderStateMixin {
  late final LottieAnimationStateMachine<T> _stateMachine;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _stateMachine = LottieAnimationStateMachine<T>(
      animation: widget.data,
      currentStateId: widget.currentStateId,
      controller: _controller,
    );
    _stateMachine.onAnimationFinished = widget.onAnimationFinished;
  }

  @override
  void didUpdateWidget(covariant LottieStateMachineWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentStateId != _stateMachine.currentStateId) {
      _stateMachine.changeState(widget.currentStateId);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _stateMachine.buildLottie(
      width: widget.width,
      height: widget.height,
    );
  }
}
