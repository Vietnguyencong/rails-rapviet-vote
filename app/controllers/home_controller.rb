class HomeController < ApplicationController

  def index
    @rappers = Rapper.all
    @data = get_rapper_data
  end

  def admin
    authenticate_admin
    @rappers = Rapper.all
    @users = User.all
  end

  #get data for chartkick
  def get_rapper_data
    _vote_count = {}
    Rapper.all.each do |r|
    _vote_count.merge!(r.name => r.get_upvotes.size)
    end
    #sort vote count descendingly by rappers
    return map_objects(Hash[_vote_count.sort_by{|k, v| v}.reverse])
  end

  # convert hash data into nested hash format for chartkick
  def map_objects(hash)
    new_obj = []
    hash.group_by(&:shift).each do |key,val|
      new_obj << {"name" => key, "data" => {"" => val}}
    end
    return new_obj
  end

  # get total vote count
  def get_total_votes
    total = 0
    Rapper.all.each do |r|
      total += r.get_upvotes.size
    end
    return total
  end
  helper_method :get_total_votes


  private
    def user_params
      params.require(:user).permit(:lucky_number)
    end

end
