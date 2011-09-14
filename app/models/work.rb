class Person < Ohm::Model
  reference :person, Person
  
  attribute :title
  attribute :section
  attribute :description
  
  set :images, Image
end