class HomeController < ApplicationController
  def index
    @rappers = Rapper.all
    @data = get_rapper_data
  end

  #get data for chartkick
  def get_rapper_data
    _vote_count = {}
    Rapper.all.each do |r|
    _vote_count.merge!(r.name => r.get_upvotes.size)
    end

    return map_objects(_vote_count.sort_by(&:first))
  end

  # convert hash data into nested hash format for chartkick
  def map_objects(hash)
    new_obj = []
    hash.group_by(&:shift).each do |key,val|
      new_obj << {"name" => key, "data" => {"" => val}}
    end
    return new_obj
  end

end
