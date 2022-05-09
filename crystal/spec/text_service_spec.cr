require "./spec_helper"

private alias TS = TextService

describe TextService do
  describe "add_typography()" do
    it "converts single quotes" do
      actual   = TS.add_typography("dog's life")
      expected = "dog’s life"

      actual.should eq expected 
    end

    it "converts double quotes" do
      actual   = TS.add_typography("\"Hey!\"")
      expected = "“Hey!”"

      actual.should eq expected
    end
  end

  describe "add_html_typography()" do
    it "creates simple fractions" do
      plaintext = "on 1/2 of an egg"
      expected = "on <sup>1</sup>&frasl;<sub>2</sub> of an egg"

      TS.add_html_typography(plaintext).should eq expected
    end
  end
end
