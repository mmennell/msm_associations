class Actor < ActiveRecord::Base
  validates(:name, { :presence => true})
  validates(:name, uniqueness: { scope: :dob })
  has_many :characters, :class_name => "Character", :foreign_key => "actor_id"
  has_many :movies, :through => :characters, :class_name => "Movie", :foreign_key => "actor_id"
end

# Actor:
#  - name: must be present; must be unique in combination with dob
#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules
