class ApplicationService
  def self.call(...)
    new(...).call
  end

  def base_uri
    'https://maps.googleapis.com/maps/api/distancematrix/json?'
  end
end
