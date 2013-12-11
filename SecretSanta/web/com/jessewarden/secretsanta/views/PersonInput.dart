import 'package:polymer/polymer.dart';
import '../vos/Person.dart';
import 'dart:html';

@CustomTag('person-input')
class PersonInput extends PolymerElement
{

	PersonInput.created() : super.created();
	
	void onSaveChanges()
	{
		InputElement firstNameInput = $["firstNameInput"];
		InputElement lastNameInput = $["lastNameInput"];
		fire('add', detail: new Person(firstNameInput.value, lastNameInput.value), canBubble: true);
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