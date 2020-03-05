require_relative "./test_helper"

describe Array do
  describe "empty" do
    it "should be empty value" do
      assert { [].to_deep_csv == "" }
    end
  end

  describe "array of array" do
    it "numbers" do
      assert { [[1, 2, 3.1]].to_deep_csv == "1,2,3.1\n" }
    end
    it "strings" do
      assert { [%w[aa cc]].to_deep_csv == "aa,cc\n" }
    end
    it "commas" do
      assert { [%w[a,a cc]].to_deep_csv == "\"a,a\",cc\n" }
    end
    it "headers" do
      assert { [%w[aa cc]].to_deep_csv(headers: true, columns: %i[a b]) == "a,b\naa,cc\n" }
    end
  end

  describe "array of hash" do
    it "numbers" do
      assert { [{a: 1, b: 2, c: 3.1}].to_deep_csv == "1,2,3.1\n" }
    end
    it "strings" do
      assert { [{q: :aa, r: :cc}].to_deep_csv == "aa,cc\n" }
    end
    it "headers" do
      assert { [{q: :aa, r: :cc}].to_deep_csv(headers: true) == "q,r\naa,cc\n" }
    end
  end
end
