class HomeController < ApplicationController
  def index
    @rappers = Rapper.all
    @data = get_rapper_data
  end

  def get_rapper_data
    _vote_count = {}
    Rapper.all.each do |r|
      _vote_count.merge!(r.name => r.get_upvotes.size)
    end
    return _vote_count.sort_by(&:first)
    
  end
end
