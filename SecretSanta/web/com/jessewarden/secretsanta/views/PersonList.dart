import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';
import 'BasePolymerElement.dart';
import 'dart:html';

@CustomTag('person-list')
class PersonList extends PolymerElement
{

	@published
	List<PersonVO> persons;
	
	PersonList.created() : super.created();
	
	
}