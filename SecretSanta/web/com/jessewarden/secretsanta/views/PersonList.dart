import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

@CustomTag('person-list')
class PersonList extends PolymerElement
{

	@observable
	List<PersonVO> persons = toObservable([]);
	
//	void persons(List<PersonVO> value)
//	{
//		_persons = value;
//	}
	
	PersonList.created() : super.created();
	
	
}