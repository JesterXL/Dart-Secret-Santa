class PersonVO
{
	String firstName;
	String lastName;
	
	PersonVO(this.firstName, this.lastName);
	
	PersonVO clone()
	{
		return new PersonVO(firstName, lastName);
	}
}