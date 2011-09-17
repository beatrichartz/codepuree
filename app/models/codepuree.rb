class Codepuree < Ohm::Model
  collection :persons, Person

  attribute :email
  attribute :phone
  attribute :biography
end