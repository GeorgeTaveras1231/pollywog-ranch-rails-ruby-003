class Frog < ActiveRecord::Base
  has_many :tadpoles, dependent: :destroy
  belongs_to :pond
end
