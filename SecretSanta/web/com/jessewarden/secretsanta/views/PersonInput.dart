import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';
import 'BasePolymerElement.dart';
import 'dart:html';

@CustomTag('person-input')
class PersonInput extends BasePolymerElement
{
//	final List<PersonVO> people = toObservable([new PersonVO("Jesse", "Warden")]);

	@observable
	PersonVO person = new PersonVO("<first name>", "<last name>");

	PersonInput.created() : super.created()
	{
		state = "view";	
	}
	
	List<String> getStates()
	{
		List<String> states = [];
		states.add("view");
		states.add("edit");
		return states;
	}
	
	void onEditClick(MouseEvent event)
	{
		event.preventDefault();
		state = "edit";
	}
	
	void onSaveChanges(MouseEvent event)
	{
		
		state = "view";
	}
	
	void onEditCancelClick(MouseEvent event)
	{
		event.preventDefault();
		state = "view";
	}
	
}