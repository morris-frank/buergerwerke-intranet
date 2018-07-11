class HomeController < ApplicationController
    before_action :authenticate_member!

    def index
      @newest_coop_files = current_member.cooperative.fileclips.last(5)
    end
  end
