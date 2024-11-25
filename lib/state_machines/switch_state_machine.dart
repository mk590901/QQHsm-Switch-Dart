import '../events/switch_events.dart';
import '../events/event.dart';
import '../interfaces/trans_methods.dart';
import '../states/switch_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class SwitchStateMachine extends BasicStateMachine {
  SwitchStateMachine(super.currentState);

  @override
  void create() {
    states_[SwitchState.state_(SwitchStates.off)] = State([
      Trans(Disable(),  SwitchState.state_(SwitchStates.disabled_off), OnDisableOff()),
      Trans(Reset(),    SwitchState.state_(SwitchStates.off), OnNothing()),
      Trans(Click(),    SwitchState.state_(SwitchStates.on), OnTrue())
    ]);

    states_[SwitchState.state_(SwitchStates.on)] = State([
      Trans(Disable(),  SwitchState.state_(SwitchStates.disabled_on), OnDisableOn()),
      Trans(Reset(),    SwitchState.state_(SwitchStates.on),  OnNothing()),
      Trans(Click(),    SwitchState.state_(SwitchStates.off), OnFalse())
    ]);

    states_[SwitchState.state_(SwitchStates.disabled_off)] = State([
      Trans(Enable(),   SwitchState.state_(SwitchStates.off), OnEnableOff()),
    ]);

    states_[SwitchState.state_(SwitchStates.disabled_on)] = State([
      Trans(Enable(),   SwitchState.state_(SwitchStates.on), OnEnableOn()),
    ]);

  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    String result = SwitchStates.values[state].name;
    return result;
  }

  @override
  void publishEvent(Event event) {
    // TODO: implement publishEvent
  }

  @override
  void publishState(int state) {
    // TODO: implement publishState
  }
}
