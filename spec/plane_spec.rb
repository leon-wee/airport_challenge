require 'plane'

describe Plane do
  describe "plane status flying or landed" do
    it "is flying when created" do
      expect(subject.status).to eq "flying"
    end
  end

  describe "plane land method" do
    it "status is landed after landing" do
      subject.land
      expect(subject.status).to eq "landed"
    end
  end

  describe "plane fly method" do
    it "status is flying after being flown" do
      expect(subject.fly).to be_flying
    end
  end

  describe "checks status of plane" do
    it "if plane land cannot be flying" do
      subject.land
      expect(subject).to_not be_flying
    end

    it "if plane fly cannot be landed" do
      expect(subject).to_not be_landed
    end

    it "if plane land should be landed" do
      expect(subject.land).to be_landed
    end

    it "if plane fly should be flown" do
      expect(subject.flying?).to eq true
    end
  end

end
