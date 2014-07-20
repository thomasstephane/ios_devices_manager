describe IOSDevices::Device do

  let(:device) { IOSDevices::Device.new({
    'id' => 1,
    'name' => 'My device',
    'deviceClass' => 'iPhone',
    'deviceDisplayName' => 'My iPhone',
    'deviceModel' => 'Fifth Gen',
    'location' => { 'latitude' => 37.8,
      'longitude' => -122.4,
      'timeStamp' => 1405814750872
    }
  })}

  describe "#params" do
    it 'sets the id' do
      expect(device.id).to eq(1)
    end

    it 'sets the name' do
      expect(device.name).to eq('My device')
    end

    it 'sets the device class' do
      expect(device.device_class).to eq('iPhone')
    end

    it 'sets the display_name' do
      expect(device.display_name).to eq('My iPhone')
    end

    it 'sets the latitude' do
      expect(device.latitude).to eq(37.8)
    end

    it 'sets the longitude' do
      expect(device.longitude).to eq(-122.4)
    end

    it 'sets the time' do
      expect(device.time).to eq(1405814750872)
    end
  end
end
