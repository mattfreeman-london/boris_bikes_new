require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#dock' do
    it 'raises an error when the station is full' do
      bike = double(:bike)
      subject.capacity.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Station full'
    end

#    it 'accepts broken bikes' do
#      bike = double(:bike, broken?: true)
#      subject.dock(bike)
#      expect(subject).not_to be_empty
#    end

  end

  describe '#release_bike' do
    it 'returns docked bikes' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases a bike' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'will not release a broken bike' do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'Bike is broken'
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    it 'defaults capacity' do
      bike = double(:bike)
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Station full'
    end
  end

end
