part of '../../success_confetti_cubit.dart';

class _SuccessConfettiState {
  _SuccessConfettiState({required this.controller, required this.isPlaying});

  final ConfettiController controller;
  final bool isPlaying;

  _SuccessConfettiState copyWith({ConfettiController? controller, bool? isPlaying}) =>
      _SuccessConfettiState(
        controller: controller ?? this.controller,
        isPlaying: isPlaying ?? this.isPlaying,
      );
}
