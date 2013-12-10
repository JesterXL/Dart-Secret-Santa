import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

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
	
}