# frozen_string_literal: true

require 'sidekiq-scheduler'

class BeerPunkApiSync
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform
    beers = PunkApi::Beers.new.get
    beers.each do |beer|
      Beer.find_or_create_by({ name: beer['name'], description: beer['description'] })
    end
  end
end
