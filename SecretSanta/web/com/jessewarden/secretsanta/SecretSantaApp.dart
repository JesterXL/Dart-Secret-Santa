import 'package:polymer/polymer.dart';
import 'dart:html';
import 'vos/PersonVO.dart';

@CustomTag('secret-santa-app')
class SecretSantaApp extends PolymerElement
{
	
	SecretSantaApp.created() : super.created();
	
	void addPerson(CustomEvent event, PersonVO detail, target)
	{
		this.$["personList"].persons.add(detail);
	}
	
}