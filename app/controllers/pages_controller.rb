class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # TODO
    # banner
    # simple search form

    # a sellection of offices maybe, by top rated, gotta think about this
    # same as this @offices = Office.all.sort_by { |office| office.avg_rating }.reverse[0..8]
    @offices = Office.all.sort_by(&:avg_rating).reverse[0..8]
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
