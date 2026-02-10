 # LottieStateMachine

A frame-accurate state machine for managing Lottie animations in Flutter using Enums.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  lottie_state_machine:
    git:
      url: https://github.com/Dzmi3y/LottieStateMachine.git
      ref: main
```
Run Command:
Open the terminal in your project folder and run:
flutter pub get
Quick Start
1. Define States

```dart

enum CharacterState { idle, jump }
```
2. Configure Data
```dart

final animationData = LottieAnimationData<CharacterState>(
  src: 'assets/robot.json',
  states: {
    CharacterState.idle: LottieAnimationState(
      id: CharacterState.idle,
      startFrame: 0,
      endFrame: 30,
      isLoop: true,
    ),
    CharacterState.jump: LottieAnimationState(
      id: CharacterState.jump,
      startFrame: 31,
      endFrame: 60,
      nextStateId: CharacterState.idle,
    ),
  },
);
```
3. Implementation
Import in Code:
import 'package:lottie_state_machine/lottie_state_machine.dart';
Initialize:
```dart

late final _stateMachine = LottieAnimationStateMachine<CharacterState>(
  animation: animationData,
  currentStateId: CharacterState.idle,
  controller: AnimationController(vsync: this),
);
```
Build & Control:
```dart

// Inside build method
_stateMachine.buildLottie(width: 200);

// Trigger change
_stateMachine.changeState(CharacterState.jump);

// Clean up
@override
void dispose() {
  _stateMachine.dispose();
  super.dispose();
}
```
