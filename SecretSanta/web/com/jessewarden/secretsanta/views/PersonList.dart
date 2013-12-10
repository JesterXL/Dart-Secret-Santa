import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

@CustomTag('person-list')
class PersonList extends PolymerElement
{

	@observable
	List<PersonVO> persons = toObservable([]);
	
	PersonList.created() : super.created();
	
	
}