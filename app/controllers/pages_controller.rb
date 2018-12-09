class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offices = Office.top_rated(6)
  end

  def about
    # TODO
    # some fancy stuff
    # statistics maybe
  end

  def contact
    # TODO
    # more fancy shit
    # contact details for the 4 admin powa
  end
end
