import 'package:polymer/polymer.dart';
import 'dart:html';
import 'vos/Person.dart';
import 'views/PersonList.dart';

@CustomTag('secret-santa-app')
class SecretSantaApp extends PolymerElement
{
	@observable
	bool readyToGenerate = false;
	
	@observable
	List<List<Person>> secretSantas = toObservable([]);
	
	SecretSantaApp.created() : super.created()
	{
//		this.notifyPropertyChange(#readyToGenerate, true, false);		
	}
	
	void generateFixtures()
	{
		PersonList personList = $["personList"];
		List<Person> persons = personList.persons;
		persons.clear();
		Person testPerson = new Person("Zoe", "Washburne");
		persons.add(testPerson);
		testPerson = new Person("Hoban", "Washburne");
		persons.add(testPerson);
		testPerson = new Person("Malcolm", "Reynolds");
		persons.add(testPerson);
		testPerson = new Person("Simon", "Tam");
		persons.add(testPerson);
		testPerson = new Person("River", "Tam");
		persons.add(testPerson);
		testPerson = new Person("Buffy", "Summers");
		persons.add(testPerson);
		testPerson = new Person("Dawn", "Summers");
		persons.add(testPerson);
		testPerson = new Person("Jesse", "Warden");
		persons.add(testPerson);
		checkReadyToGenerate();
	}
	
	void addPerson(CustomEvent event, Person detail, target)
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
		List<Person> personsReference = personList.persons;
		List<Person> persons = [];
		persons.addAll(personsReference);
		secretSantas.clear();
		
		dynamic waitingList = [];
		
		persons.forEach((Person person)
		{
			person.secretSanta = null;
			Iterable exclusionsIterable = persons.where((Person excludePerson)
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
			Person personNeedsASecretSanta = waitingObject["person"];
			List<Person> waitingExclusions = waitingObject["exclusions"];
			Function orElse()
			{
				print("orElse ran");
			};
			Person targetSecretSanta;
			persons.forEach((Person person)
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