class Director < ActiveRecord::Base
  validates(:name, { :presence => true})
  validates(:name, uniqueness: { scope: :dob })
  has_many :movies, :class_name => "Movie", :foreign_key => "director_id"

end

# Director:
#  - name: must be present; must be unique in combination with dob
#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules
