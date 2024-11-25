//	Class Sw1Wrapper automatically generated at 2024-11-24 13:58:31
import '../QQHsm/QQHsmEngine.dart';
import '../core/utilities/utils.dart';
import '../interfaces/i_switch.dart';

class Sw1Wrapper {
	final QQHsmEngine _engine;
	final ISwitch _switch;
	static bool process = false;
	Map<String, void Function()> lookupTable = <String, void Function()>{};
	Sw1Wrapper (this._engine, this._switch) {
		createWalker();
	}

	bool inLoop() {
		return process;
	}

	void createWalker() {
		lookupTable[createKey("SWITCH","Q_ENTRY")]	= SWITCHEntry;
		lookupTable[createKey("SWITCH","Q_EXIT")]	= SWITCHExit;
		lookupTable[createKey("SWITCH","Q_INIT")]	= SWITCHInit;
		lookupTable[createKey("IDLE","Q_ENTRY")]	= IDLEEntry;
		lookupTable[createKey("IDLE","Q_EXIT")]	= IDLEExit;
		lookupTable[createKey("IDLE","Q_INIT")]	= IDLEInit;
		lookupTable[createKey("IDLE","RESET")]	= IDLEReset;
		lookupTable[createKey("ON","Q_ENTRY")]	= ONEntry;
		lookupTable[createKey("ON","Q_EXIT")]	= ONExit;
		lookupTable[createKey("ON","TURN")]	= ONTurn;
		lookupTable[createKey("OFF","Q_ENTRY")]	= OFFEntry;
		lookupTable[createKey("OFF","Q_EXIT")]	= OFFExit;
		lookupTable[createKey("OFF","TURN")]	= OFFTurn;
	}

	void SWITCHEntry() {
		print("inside SWITCHEntry");
	}

	void SWITCHExit() {
		print("inside SWITCHExit");
	}

	void SWITCHInit() {
		print("inside SWITCHInit");
	}

	void IDLEEntry() {
		print("inside IDLEEntry");
	}

	void IDLEExit() {
		print("inside IDLEExit");
	}

	void IDLEInit() {
		print("inside IDLEInit");
	}

	void IDLEReset() {
		process = false;
		print("inside IDLEReset -> [$process]");
	}

	void ONEntry() {
		print("inside ONEntry [$process]");
		Future.microtask(() {
			turn();
			_switch.t();
		});
	}

	void ONExit() {
		print("inside ONExit");
	}

	void ONTurn() {
		print("inside ONTurn");
	}

	void OFFEntry() {
		print("inside OFFEntry [$process]");
		Future.microtask(() {
			turn();
			_switch.f();
		});

	}

	void OFFExit() {
		print("inside OFFExit");
	}

	void OFFTurn() {
		process = true;
		print("inside OFFTurn -> [$process]");
	}

	void turn() async {

		await Future.delayed(const Duration(milliseconds: 500));
		if (!process) {
			return;
		}
		_engine.done('TURN');
	}

	void done(String state, String event) {
		void Function()? function = lookupTable[createKey(state,event)];
		if (function != null) {
			function();
		}
	}

}
