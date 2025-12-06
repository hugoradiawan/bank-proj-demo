part of '../success_confetti_cubit.dart';

class _SuccessConfettiCubit extends Cubit<_SuccessConfettiState> {
  _SuccessConfettiCubit()
      : super(
          _SuccessConfettiState(
            controller: ConfettiController(
              duration: const Duration(seconds: 4),
            ),
            isPlaying: false,
          ),
        ) {
    _startCelebration();
  }

  Timer? _timer;

  void _startCelebration() {
    state.controller.play();
    emit(state.copyWith(isPlaying: true));
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 4), stopConfetti);
  }

  void stopConfetti() {
    if (!state.isPlaying) {
      return;
    }
    state.controller.stop();
    emit(state.copyWith(isPlaying: false));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    state.controller.dispose();
    return super.close();
  }
}
