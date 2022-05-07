Booking.destroy_all
Pet.destroy_all
User.destroy_all

# users

leonor = { username: 'leonor',
           address: '10 rue de paradis, 75010 Paris',
           password: 'petzotic',
           email: 'leonor.varela91330@gmail.com' }

etienne = { username: 'etienne',
            address: 'avenue daumesnil, 75012 Paris',
            password: 'petzotic',
            email: 'etiennededi@hotmail.fr' }

boris = { username: 'boris',
          address: 'route de la pyramide, 75012 Paris',
          password: 'petzotic',
          email: 'bourdetboris@gmail.com' }

ghita = { username: 'ghita',
          address: '5 avenue Albert de Mun, 75016 Paris',
          password: 'petzotic',
          email: 'aa.ghita@gmail.com' }

users = [leonor, etienne, boris, ghita]

def seed_users(users)
  users.each do |user|
    User.new(user).save!
  end
  p 'Seeds Users saved'
end

seed_users(users)

# pets
created_users = User.all

tarzan = { category: 'mammal',
           name: 'Tarzan',
           description: 'Tarzan is not very evolved. He descends from the monkey, the tree and the neighbour, but don\'t hold it against him. Unfortunately, he will not be able to show great subtlety, but will know how to defend your home and your wife, if you have one. If you don\'t, pretend to have one and it will make the animal very happy. It can smell a little strong sometimes, but we rent with it a tropical atmosphere mist to delicately embalm your interior.',
           price: 2,
           specie: 'Mi-monkey, mi-man'
           }

roger = { category: 'mammal',
          name: 'Roger',
          description: "Soft and kind as a kitten, roger will go perfectly with your interior. He has a neat coat like the carpet and brown whiskers that will match very well with your curtains whatever their color. He doesn't eat much, at set times, of course. If he bothers you by making too much noise, we even have a small electric collar that will do the job of silence perfectly.",
          price: 990,
          specie: 'Bengal tiger'
          }

jamila = { category: 'mammal',
           name: 'Jamila',
           description: 'Jamila is so to speak not very present. Not one to look for lice, it blends in with the decor, especially if you have tall trees around your home. She loves making jokes and eating bananas. But she also knows how to iron, do the housework, the dishes,... she really likes to mimic everything you do. If you have children, she can even do their homeworks. Easy as a monkey.',
           price: 38,
           specie: 'African gorilla'


carlos = { category: 'mammal',
           name: 'Carlos',
           description: "Very docile, Carlos will follow you everywhere. Some clutter issues sometimes, but after all it's not the size that counts. However, do not venture to take the metro with him, it could end in tragedy. Taupe gray color, and name rhinoceros, Carlos is an original. Very little talker",
           price: 10000,
           specie: 'Java Rhinoceros'
          }

nala = { category: 'mammal',
         name: 'Nala',
         description: 'Long brown horns, gazelle smile and doe eyes, Nala is really good looking. She will impress your in-laws familly with her good manners. You can also use its horns as coat racks, bag holders on the go or vestiaire at a party, if it runs out',
         price: 1030,
         specie: 'Hirola'
        }

pets = [tarzan, roger, jamila, carlos, nala]

def seed_pets(pets)
  photo_carlos = File.open(Rails.root.join("public/seed_images/carlos.jpeg"))
  photo_jamila = File.open(Rails.root.join("public/seed_images/jamila.jpeg"))
  photo_nala = File.open(Rails.root.join("public/seed_images/nala.jpg"))
  photo_tarzan = File.open(Rails.root.join("public/seed_images/tarzan.jpg"))
  photo_roger = File.open(Rails.root.join("public/seed_images/roger.jpeg"))



  photos = [photo_tarzan, photo_roger, photo_jamila, photo_carlos, photo_nala]

  pets.each_with_index do |pet, index|
    animal = Pet.new(pet.merge({ user: User.all.sample }))
    animal.photos.attach(io: photos[index], filename: pet, content_type: 'jpeg')
    animal.save!
  end
  p 'Seeds Pets saved'
end

# call methods seed

seed_pets(pets)

user = User.create(email: "test@test.com", password: "azerty")
pet = Pet.first
booking = Booking.new(starting_date: Date.today, ending_date: Date.tomorrow, user: user, pet: pet)
booking.save!
