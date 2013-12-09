import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';
import 'BasePolymerElement.dart';
import 'dart:html';

@CustomTag('person-list')
class PersonList extends PolymerElement
{

	@observable
	List<PersonVO> persons = toObservable([new PersonVO("Jesse", "Warden")]);
	
	PersonList.created() : super.created();
	
	
}