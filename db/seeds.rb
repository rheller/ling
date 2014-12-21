# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    spanish = Language.create(name: 'Spanish')
    good = Meaning.create(denotation: 'good')
    hello = Meaning.create(denotation: 'hello')
    goodbye = Meaning.create(denotation: 'goodbye')
    bueno = Word.create(spelling: 'bueno', language: spanish,  meaning: good)
