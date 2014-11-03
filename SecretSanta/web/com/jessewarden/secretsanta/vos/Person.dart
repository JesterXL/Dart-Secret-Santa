library secretsantalib;

import 'package:polymer/polymer.dart';

class Person
{
	@observable
	String firstName;
	@observable
	String lastName;
	@observable
	Person secretSanta;
	
	Person(this.firstName, this.lastName);
	
	Person clone()
	{
		Person vo = new Person(firstName, lastName);
		vo.secretSanta = secretSanta;
		return vo;
	}
}