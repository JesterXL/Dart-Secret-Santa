import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

@CustomTag('person-input')
class PersonInput extends PolymerElement
{

	@observable
	PersonVO person;

	PersonInput.created() : super.created();
	
	void onSaveChanges()
	{
		fire('add', canBubble: true);
	}
	
	
	
}