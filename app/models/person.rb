class Person < Ohm::Model
  reference :codepuree, Codepuree
  
  collection :works, Work
  
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :password
  attribute :phone
  attribute :biography
  
  def password=(data)
    super(Digest::SHA512.hexdigest(data))
  end
end