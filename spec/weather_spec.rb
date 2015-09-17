require 'weather'

describe Weather do
  it "intiailizes with a weather status" do
    expect(subject.status).to eq "sunny"
  end

  context "current weather" do
    context "should be sunny between 0-2" do
      it "should be sunny when randomizer is 0" do
        allow(subject).to receive(:randomizer) { 0 }
        expect(subject.current_weather).to eq "sunny"
      end

      it "should be sunny when randomizer is 1" do
        allow(subject).to receive(:randomizer) { 1 }
        expect(subject.current_weather).to eq "sunny"
      end

      it "should be sunny when randomizer is 2" do
        allow(subject).to receive(:randomizer) { 2 }
        expect(subject.current_weather).to eq "sunny"
      end

    end

    context "should be stormy between 3-4" do
      it "should be stormy when randomizer is 3" do
        allow(subject).to receive(:randomizer) { 3 }
        expect(subject.current_weather).to eq "stormy"
      end

      it "should be stormy when randomizer is 4" do
        allow(subject).to receive(:randomizer) { 4 }
        expect(subject.current_weather).to eq "stormy"
      end
    end
  end

end