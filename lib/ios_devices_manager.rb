require 'base64'
require 'json'
require 'net/http'
require 'net/https'
require 'typhoeus'
require 'uri'
require 'ios_devices_manager/device'

module IOSDevices
  class Manager < OpenStruct

    INIT_CLIENT         = 'initClient'
    REFRESH_CLIENT      = 'refreshClient'
    SEND_MESSAGE        = 'sendMessage'
    PLAY_SOUND          = 'playSound'

    def initialize username, password
      super({username: username, devices: []})
      @username = username
      @password = password
      @partition = nil
      @baseURI = "/fmipservice/device/#{@username}/"

      get_partition
      get_devices
    end

    def send(device, title = '', msg = '', sound = false)
      options = {
        'device'   => device.id,
        'subject'  => title,
        'text'     => msg,
        'sound'    => sound,
        'userText' => true
      }
      post(SEND_MESSAGE, options)
    end

    def play_sound(device, subject = '')
      options = {
        'device'  => device.id,
        'subject' => subject
      }
      post(PLAY_SOUND, options)
    end

    def get_devices
      response = post(INIT_CLIENT)
      self.devices = parse_devices(response)
    end

    def update_devices
      response = post(REFRESH_CLIENT)
      self.devices = parse_devices(response)
    end

    def parse_devices(data)
      JSON.parse(data.body)['content'].collect { |device| Device.new(device) }
    end

    private

    def get_partition
      response = post(@initClient)
      @partition = response.headers['X-Apple-MMe-Host']
    end

    def post_headers
      {
        'Content-Type'          => 'application/json; charset=utf-8',
        'X-Apple-Find-Api-Ver'  => '2.0',
        'X-Apple-Authscheme'    => 'UserIdGuest',
        'X-Apple-Realm-Support' => '1.0',
        'Accept-Language'       => 'en-us',
        'userAgent'             => 'iOS Devices Manager',
        'Connection'            => 'keep-alive'
      }
    end

    def post url, options = nil
      uri = @partition ? "https://#{@partition}#{@baseURI}#{url}" : "https://fmipmobile.icloud.com#{@baseURI}#{url}"

      unless options.nil?
        clientContext = {
          'clientContext' => {
            'appName'      => 'FindMyiPhone',
            'appVersion'   => '2.0.2',
            'shouldLocate' => false
          }
        }
        body = JSON.generate(clientContext.merge(options))
        post_with(uri, body)
      else
        post_with(uri)
      end
    end

    def post_with(uri, body = nil)
      if body
        Typhoeus::Request.post(uri, userpwd: "#{@username}:#{@password}", headers: post_headers, followlocation: true, verbose: true, maxredirs: 10, body: body)
      else
        Typhoeus::Request.post(uri, userpwd: "#{@username}:#{@password}", headers: post_headers, followlocation: true, verbose: true, maxredirs: 10)
      end
    end
  end
end
