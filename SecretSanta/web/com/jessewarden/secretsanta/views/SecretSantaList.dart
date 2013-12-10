import 'package:polymer/polymer.dart';
import '../vos/Person.dart';

@CustomTag('secret-santa-list')
class SecretSantaList extends PolymerElement
{

	@published
	List<List<Person>> secretSantas = toObservable([]);
	
	SecretSantaList.created() : super.created();
	
	
}