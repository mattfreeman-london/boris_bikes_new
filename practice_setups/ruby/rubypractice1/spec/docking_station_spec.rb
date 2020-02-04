require 'docking_station'

describe DockingStation do

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#dock' do
    it 'raises an error when the station is full' do
      subject.capacity.times do
        subject.dock Bike.new
      end
      expect { subject.dock Bike.new }.to raise_error 'Station full'
    end

    it 'accepts broken bikes' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(@bikes.count).to eq(1)
    end

  end

  describe '#release_bike' do
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike).to be_working
    end

#    it 'will not release a broken bike' do
#      bike = Bike.new
#      bike.report_broken
#      subject.dock(bike)
#      expect { subject.release_bike }.to raise_error 'Bike is broken'
#    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Station full'
    end
  end

end
