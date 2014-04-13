require 'spec_helper'

describe Person do
  describe "#take_a_walk" do
    it "walks you to work" do
      expect(subject.take_a_walk :work).to eq("you walk to work")
    end

    it "walks you home" do
      expect(subject.take_a_walk :home).to eq("you walk home")
    end

    it "walks you home" do
      expect(subject.take_a_walk :dark_alley).to eq("you are eaten by a grue")
    end

    it "takes exception to other options" do
      expect{subject.take_a_walk :not_a_place}.to raise_error(ArgumentError)
    end
  end
end
