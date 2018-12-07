class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @offices = Office.all.sort_by(&:avg_rating).reverse[0..5]
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
