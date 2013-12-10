library secretsantalib;

class Person
{
	String firstName;
	String lastName;
	Person secretSanta;
	
	Person(this.firstName, this.lastName);
	
	Person clone()
	{
		Person vo = new Person(firstName, lastName);
		vo.secretSanta = secretSanta;
		return vo;
	}
}