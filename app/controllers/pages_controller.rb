class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cars = Car.all.order(created_at: :desc)[0..5]
  end
end
