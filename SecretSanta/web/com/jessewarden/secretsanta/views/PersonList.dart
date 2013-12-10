import 'package:polymer/polymer.dart';
import '../vos/Person.dart';

@CustomTag('person-list')
class PersonList extends PolymerElement
{

	@published
	List<Person> persons = toObservable([]);
	
	PersonList.created() : super.created();
	
	
}