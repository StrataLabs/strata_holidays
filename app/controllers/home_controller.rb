class HomeController < ApplicationController
  layout "home"
  before_filter :authenticate_user!, :except => 'index'
  def index
    vcs = VacationConsultant.all
    @vcs = vcs.sort_by{rand}[0..5]
    @testimonials = Testimonial.all.sort_by{rand}[0..5]
    @user_response = UserResponse.new
  end
end
