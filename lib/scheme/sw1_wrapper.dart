//	Class Sw1Wrapper automatically generated at 2024-11-24 13:58:31
import '../QQHsm/QQHsmEngine.dart';
import '../core/utilities/utils.dart';
import '../interfaces/i_click.dart';

class Sw1Wrapper {
	final QQHsmEngine _engine;
	final IClick _clicker;
	static bool process = false;
	Map<String, void Function()> lookupTable = <String, void Function()>{};
	Sw1Wrapper (this._engine, this._clicker) {
		createWalker();
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
		// if (!process) {
		// 	print("inside ONEntry exit");
		// 	return;
		// }
		Future.microtask(() {
			turn('ON Entry');
			_clicker.click();
		});
	}

	void ONExit() {
		print("inside ONExit");
	}

	void ONTurn() {
		//process = true;
		print("inside ONTurn");
	}

	void OFFEntry() {
		print("inside OFFEntry [$process]");
		// if (!process) {
		// 	print("inside OFFEntry exit");
		// 	//***process = true;
		// 	return;
		// }
		Future.microtask(() {
			turn('OFF Entry');
			_clicker.click();
		});

	}

	void OFFExit() {
		print("inside OFFExit");
	}

	void OFFTurn() {
		process = true;
		print("inside OFFTurn -> [$process]");
	}

	void turn(String text) async {

		await Future.delayed(const Duration(seconds: 1));
		print('******* TURN ******* [$text]');
		//process = true;

		print('******* TURN ******* [$process]');
		if (!process) {
			print('******* TURN ******* EXIT');
			return;
		}
		_engine.done('TURN');
		//_clicker.click();
	}

	void done(String state, String event) {
		void Function()? function = lookupTable[createKey(state,event)];
		if (function != null) {
			function();
		}
	}

}
