import 'package:polymer/polymer.dart';
import '../vos/Person.dart';
import 'dart:html';

@CustomTag('person-input')
class PersonInput extends PolymerElement
{

	@observable
	Person person = new Person('', '');

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