require 'weather'

describe Weather do
  it "intiailizes with a weather status" do
    expect(subject.status).to eq "sunny"
  end

  context "sunny weather" do
    it "should be sunny between 0-2" do

    end
  end

end