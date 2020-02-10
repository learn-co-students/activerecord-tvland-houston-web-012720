class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network


  # def build_network(call_letters: call_letters)
  #   network = Network.create(call_letters: call_letters)
  #   self.network_id = network.id
  #   network
  # end

  def actors_list
    self.actors.map {|actor| actor.full_name}
  end


end