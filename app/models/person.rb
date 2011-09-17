class Person < Ohm::Model
  reference :codepuree, Codepuree
  
  collection :works, Work
  
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :phone
  attribute :biography
end