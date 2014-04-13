class Person < ActiveRecord::Base
  attr_accessible :name

  def take_a_walk to_place
    {
      work: "you walk to work",
      home: "you walk home",
      dark_alley: "you are eaten b a grue",
    }.fetch(to_place) { fail ArgumentError }
  end
end
