# LottieStateMachine

A frame-accurate state machine for managing Lottie animations in Flutter using Enums.

## Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  lottie_state_machine:
    git:
      url: https://github.com/Dzmi3y/LottieStateMachine.git
      ref: main
```

Usage

1. Define states

```dart
enum CatState { idle, walk, jump }
```

2. Configure animation

```dart

final catAnimation = LottieAnimationData<CatState>(
  src: 'assets/cat.json',
  states: {
    CatState.idle: LottieAnimationState(
      id: CatState.idle,
      startFrame: 0,
      endFrame: 29,
      isLoop: true,
    ),
    CatState.walk: LottieAnimationState(
      id: CatState.walk,
      startFrame: 30,
      endFrame: 59,
      nextStateId: CatState.idle,
    ),
  },
);
```

3. Use widget

```dart

LottieStateMachineWidget<CatState>(
  data: catAnimation,
  currentStateId: _currentState,
  onAnimationFinished: (state) {
    print('$state completed');
  },
)
```

4. Change state

```dart

setState(() => _currentState = CatState.walk);
```

API
LottieAnimationState<T>

    id - State identifier

    startFrame/endFrame - Frame range

    nextStateId - Next state (optional)

    isLoop - Loop animation (default: false)

    speed - Playback speed (default: 1.0)

Requirements

    Flutter >= 3.0.0

    Dart >= 3.0.0

    lottie: ^3.1.0
