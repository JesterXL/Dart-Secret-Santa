import 'package:polymer/polymer.dart';
import 'dart:html';
import 'vos/PersonVO.dart';
import 'views/PersonList.dart';

@CustomTag('secret-santa-app')
class SecretSantaApp extends PolymerElement
{
	@observable
	bool readyToGenerate = false;
	
	@observable
	List<List<PersonVO>> secretSantas = toObservable([]);
	
	SecretSantaApp.created() : super.created()
	{
//		this.notifyPropertyChange(#readyToGenerate, true, false);		
	}
	
	void generateFixtures()
	{
		PersonList personList = $["personList"];
		personList.persons.clear();
		personList.persons.add(new PersonVO("Zoe", "Washburne"));
		personList.persons.add(new PersonVO("Hoban", "Washburne"));
		personList.persons.add(new PersonVO("Malcolm", "Reynolds"));
		personList.persons.add(new PersonVO("Simon", "Tam"));
		personList.persons.add(new PersonVO("River", "Tam"));
		personList.persons.add(new PersonVO("Buffy", "Summers"));
		personList.persons.add(new PersonVO("Dawn", "Summers"));
		personList.persons.add(new PersonVO("Jesse", "Warden"));
		checkReadyToGenerate();
	}
	
	void addPerson(CustomEvent event, PersonVO detail, target)
	{
		PersonList personList = this.$["personList"];
		personList.persons.add(detail);
		checkReadyToGenerate();
	}
	
	void checkReadyToGenerate()
	{
		PersonList personList = this.$["personList"];
		if(personList.persons.length >= 4 && personList.persons.length % 2 == 0)
		{
			readyToGenerate = true;
		}
		else
		{
			readyToGenerate = false;
		}
	}
	// Seth Ladd says: A person can't be their own santa, and a person can't be a santa for someone with the same last name.
	void generateSecretSantas()
	{
		PersonList personList = this.$["personList"];
		List<PersonVO> personsReference = personList.persons;
		List<PersonVO> persons = [];
		persons.addAll(personsReference);
		secretSantas.clear();
		
		dynamic waitingList = [];
		
		persons.forEach((PersonVO person)
		{
			person.secretSanta = null;
			Iterable exclusionsIterable = persons.where((PersonVO excludePerson)
			{
				if(excludePerson == person || excludePerson.lastName == person.lastName)
				{
					return true;
				}
				else
				{
					return false;
				}
			});
			List exclusions = exclusionsIterable.toList();
			waitingList.add({"person": person, "exclusions": exclusions});	
		});
		
		
		
		waitingList.forEach((dynamic waitingObject)
		{
			PersonVO personNeedsASecretSanta = waitingObject["person"];
			List<PersonVO> waitingExclusions = waitingObject["exclusions"];
			Function orElse()
			{
				print("orElse ran");
			};
			PersonVO targetSecretSanta;
			persons.forEach((PersonVO person)
			{
				if(person.secretSanta == null && waitingExclusions.contains(person) == false)
				{
					targetSecretSanta = person;
					return true;
				}
			});
//			assert(targetSecretSanta != null);
			if(targetSecretSanta != null)
			{
				personNeedsASecretSanta.secretSanta = targetSecretSanta;
				targetSecretSanta.secretSanta = personNeedsASecretSanta;
				secretSantas.add([personNeedsASecretSanta, targetSecretSanta]);
			}
		});
		this.notifyPropertyChange(#secretSantas, null, secretSantas);
	}
	
	
	
}