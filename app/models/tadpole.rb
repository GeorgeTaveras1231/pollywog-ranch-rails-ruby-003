class Tadpole < ActiveRecord::Base
  belongs_to :frog
  has_one :pond, through: :frog

  def evolve
    new_frog = Frog.new(name: name, color: color, pond_id: self.frog.pond.id)
    if new_frog.save
      destroy
      new_frog
    else
      nil
    end
  end
end
