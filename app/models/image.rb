class Image < Ohm::Model  
  set :variants, ImageVariant
  attribute :original
end