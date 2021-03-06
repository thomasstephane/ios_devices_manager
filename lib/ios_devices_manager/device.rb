require 'ostruct'

module IOSDevices
  class Device < OpenStruct

    def initialize(params)
      location = params['location']
      super({
        id: params['id'],
        name: params['name'],
        device_class: params['deviceClass'],
        display_name: params['deviceDisplayName'],
        model: params['deviceModel'],
        latitude: location ? location['latitude'] : nil,
        longitude: location ? location['longitude'] : nil,
        time: location ? location['timeStamp'] : nil
      })
    end
  end
end
