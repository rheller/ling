# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    spanish = Language.create(name: 'Spanish')
    english = Language.create(name: 'English')
    french = Language.create(name: 'French')

    hank = User.create(email:  'hank@hank.com', password: 'password', password_confirmation: 'password', full_name: 'Hank Rollins', from_language_id: english.id, to_language_id: spanish.id)

    good = Meaning.create(denotation: 'Good')
    hello = Meaning.create(denotation: 'Hello')
    goodbye = Meaning.create(denotation: 'Goodbye')

    Word.create(spelling: 'Bueno', language: spanish,  meaning: good)
    Word.create(spelling: 'Adios', language: spanish,  meaning: goodbye)
    Word.create(spelling: 'Hola', language: spanish,  meaning: hello)

    Word.create(spelling: 'Bon', language: french,  meaning: good)
    Word.create(spelling: 'Adieu', language: french,  meaning: goodbye)
    Word.create(spelling: 'Bonjour', language: french,  meaning: hello)

    Word.create(spelling: 'Good', language: english,  meaning: good)
    Word.create(spelling: 'Hello', language: english,  meaning: hello)
    Word.create(spelling: 'Goodbye', language: english,  meaning: goodbye)

