import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

@CustomTag('persons-model')
class PersonsModel extends PolymerElement
{
	@published
	List<PersonVO> persons = toObservable([new PersonVO("Jesse", "Warden")]);
	
	PersonsModel.created() : super.created();
	
	
}