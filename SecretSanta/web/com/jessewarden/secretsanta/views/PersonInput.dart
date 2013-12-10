import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';
import 'dart:html';

@CustomTag('person-input')
class PersonInput extends PolymerElement
{

	@observable
	PersonVO person = new PersonVO('', '');

	PersonInput.created() : super.created();
	
	void onSaveChanges()
	{
		fire('add', detail: person.clone(), canBubble: true);
	}
	
	void onInputKeyUp(KeyboardEvent event)
	{
		if(event.keyCode == KeyCode.ENTER && event.target == this.$["lastNameInput"])
		{
			event.preventDefault();
			onSaveChanges();
			InputElement firstNameInput = $["firstNameInput"];
			InputElement lastNameInput = $["lastNameInput"];
			firstNameInput.value = "";
			lastNameInput.value = "";
			$["firstNameInput"].focus();
		}
	}
	
}