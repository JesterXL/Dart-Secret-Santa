import 'package:polymer/polymer.dart';
import 'vos/PersonVO.dart';

@CustomTag('secret-santa-app')
class SecretSantaApp extends PolymerElement
{
	
	SecretSantaApp.created() : super.created();
	
	void addPerson()
	{
		PersonVO vo = new PersonVO("test", "test");
		this.$["personList"].persons.add(vo);
	}
	
}