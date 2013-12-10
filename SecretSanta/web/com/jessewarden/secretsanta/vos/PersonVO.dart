library secretsantalib;

class PersonVO
{
	String firstName;
	String lastName;
	PersonVO secretSanta;
	
	PersonVO(this.firstName, this.lastName);
	
	PersonVO clone()
	{
		PersonVO vo = new PersonVO(firstName, lastName);
		vo.secretSanta = secretSanta;
		return vo;
	}
}