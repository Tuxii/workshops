class PagesController < ApplicationController
  def home
    @published_workshops_count = Workshop.published.count
  end
end
