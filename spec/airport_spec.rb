require 'airport'

describe Airport do
  let(:plane) { double :plane }
  before(:each) do
    allow(plane).to receive(:land).and_return plane
    allow(plane).to receive(:fly).and_return plane
  end

  let(:weather) { double :weather }
  subject(:airport) { described_class.new(weather)}

  describe 'take off' do
    it "releases a plane" do
      subject.landing(plane)
      expect(subject.plane_takes_off).to eq plane
    end

    it "cannot release a plane in empty airport" do
      expect{subject.plane_takes_off}.to raise_error "Airport empty"
    end
  end

  describe "landing" do
    it "instructs a plane to land" do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it "ensures that landed plane status is landing" do
      expect(plane).to receive :land
      subject.landing(plane)
    end

    it "ensures that taken off plane status is flying" do
      subject.landing(plane)
      expect(plane).to receive :fly
      subject.plane_takes_off
    end

    it "receives a plane" do
      subject.landing(plane)
      expect(subject).not_to be_empty
    end
  end

  describe "initialized stage" do
    it "has a default capacity when initialized" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "should have a weather argument" do
      expect(subject.weather).to eq weather
    end
  end

  describe "traffic control" do
    context "when airport is full" do
      it "does not allow a plane to land" do
        subject.capacity.times { subject.landing(plane) }
        expect{subject.landing(plane)}.to raise_error "Airport is full"
      end
    end

    context "when weather conditions are stormy" do
      before{allow(subject).to receive(:weather).and_return 'stormy'}

      it "should be stormy between" do
        expect(subject.weather).to eq "stormy"
      end

      it "does not allow a plane to take off in storm" do
        expect{ subject.plane_takes_off }.to raise_error "Can't take off in storm"
      end

      it "does not allow a plane to land in storm" do
        expect{ subject.landing(plane) }.to raise_error "Can't land in storm"
      end
    end

    context "when weather conditions are sunny" do
      before{allow(subject).to receive(:weather).and_return 'sunny'}

      it "should be stormy between" do
        expect(subject.weather).to eq "sunny"
      end

      it "does not allow a plane to take off in storm" do
        subject.landing(plane)
        expect(subject.plane_takes_off).to eq plane
      end

      it "does not allow a plane to land in storm" do
        expect(subject.landing(plane)).to eq [plane]
      end
    end
  end
end
