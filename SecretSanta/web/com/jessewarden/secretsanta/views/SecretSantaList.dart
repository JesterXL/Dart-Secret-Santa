import 'package:polymer/polymer.dart';
import '../vos/PersonVO.dart';

@CustomTag('secret-santa-list')
class SecretSantaList extends PolymerElement
{

	@published
	List<List<PersonVO>> secretSantas = toObservable([]);
	
	SecretSantaList.created() : super.created();
	
	
}