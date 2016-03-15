class Portion < ActiveRecord::Base
  belongs_to :legume
  belongs_to :generation
  belongs_to :panier
end
