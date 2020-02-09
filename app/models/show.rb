class Show < ActiveRecord::Base
  has_many :characters
  belongs_to :network
  has_many :actors, through: :characters

  def actors_list 
    actor_ids = Character.all.where('show_id = ?',self.id).pluck(:actor_id)
    Actor.all.where('id = ?',actor_ids).pluck(:first_name, :last_name).collect{|name| name.join(" ")}
  end

end