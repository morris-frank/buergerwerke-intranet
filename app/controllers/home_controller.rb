class HomeController < ApplicationController
    before_action :authenticate_member!
  end
