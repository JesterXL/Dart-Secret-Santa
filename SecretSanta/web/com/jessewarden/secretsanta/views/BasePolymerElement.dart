import 'package:polymer/polymer.dart';

import '../../statemachine/statemachinelib.dart';

abstract class BasePolymerElement extends PolymerElement
{
	StateMachine fsm;
	@observable String _state;
	
	void set state(String value)
	{
		if(value == null)
		{
			return;
		}
		String oldValue = _state;
		_state = value;
		fsm.changeState(_state);
		this.notifyPropertyChange(#state, oldValue, value);
	}
	
	String get state
	{
		return _state;
	}
	
	BasePolymerElement.created(): super.created()
	{
		fsm = new StateMachine();
		List<String> states = getStates();
		states.forEach((String stateName)
		{
			fsm.addState(stateName);	
		});
	}
	
	List<String> getStates();
	
//	void onStateChanged(StateMachineEvent event);
}