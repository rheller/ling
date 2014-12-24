# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    spanish = Language.create(name: 'Spanish')
    english = Language.create(name: 'English')

    hank = User.create(email:  'hank@hank.com', password: 'password', full_name: 'Hank Rollins', from_language_id: english.id, to_language_id: spanish.id)

    good = Meaning.create(denotation: 'good')
    hello = Meaning.create(denotation: 'hello')
    goodbye = Meaning.create(denotation: 'goodbye')

    Word.create(spelling: 'bueno', language: spanish,  meaning: good)
    Word.create(spelling: 'adios', language: spanish,  meaning: goodbye)
    Word.create(spelling: 'hola', language: spanish,  meaning: hello)

    Word.create(spelling: 'good', language: english,  meaning: good)
    Word.create(spelling: 'hello', language: english,  meaning: hello)
    Word.create(spelling: 'goodbye', language: english,  meaning: goodbye)

