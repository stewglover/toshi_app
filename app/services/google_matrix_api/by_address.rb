# frozen_string_literal: true

require 'httparty'

module GoogleMatrixApi
  class ByAddress < ApplicationService

    def initialize(attributes = {})
      super()
      @start_address = attributes[:start_address]
      @end_address = attributes[:end_address]
    end

    def call
    response = generate_google_hash
      unless response[:status] == 'OK'
        log_error(response[:error_message])
      end
    seconds = response.dig(:rows, 0, :elements, 0, :duration, :value)
    binding.pry
    calculate_minutes(seconds)
    end

    private

    attr_reader :end_address, :start_address

    EXCLUDED_KEYS = %i[destination_addresses origin_addresses].freeze

    def parse(object)
      object.deep_symbolize_keys.except!(*EXCLUDED_KEYS)
    end

    def generate_google_hash
      parse(HTTParty.get("#{base_uri}origins=#{start_address}&destinations=#{end_address}&key=#{ENV['API_KEY']}"))
    end

    def calculate_minutes(seconds)
      seconds / 1.minutes
    end

    def log_error(error)
      Rails.logger.warn(error.to_s)
    end

  end
end
