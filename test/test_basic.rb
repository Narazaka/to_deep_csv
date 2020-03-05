require_relative "./test_helper"

describe Array do
  subject { values.to_deep_csv }

  describe "empty" do
    let(:values) { [] }
    it "should be empty value" do
      assert { subject == "" }
    end
  end

  describe "array of array" do
    describe "numbers" do
      let(:values) { [[1, 2, 3.1]] }
      it "should csv" do
        assert { subject == "1,2,3.1\n" }
      end
    end
    describe "strings" do
      let(:values) { [%w[aa cc]] }
      it "should csv" do
        assert { subject == "aa,cc\n" }
      end
    end
    describe "commas" do
      let(:values) { [%w[a,a cc]] }
      it "should csv" do
        assert { subject == "\"a,a\",cc\n" }
      end
    end
    describe "headers" do
      let(:values) { [%w[aa cc]] }
      subject { values.to_deep_csv(headers: true, columns: %i[a b]) }
      it "should csv" do
        assert { subject == "a,b\naa,cc\n" }
      end
    end
  end

  describe "array of hash" do
    describe "strings" do
      let(:values) { [{ q: :aa, r: :cc }] }
      it "should csv" do
        assert { subject == "aa,cc\n" }
      end
    end
    describe "headers" do
      let(:values) { [{ q: :aa, r: :cc }] }
      subject { values.to_deep_csv(headers: true) }
      it "should csv" do
        assert { subject == "q,r\naa,cc\n" }
      end
    end
  end
end
