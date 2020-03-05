require_relative "./test_helper"

describe Array do
  describe "empty" do
    it "should be empty value" do
      assert_equal [].to_deep_csv, ""
    end
  end

  describe "array of array" do
    it "numbers" do
      assert_equal [[1, 2, 3.1]].to_deep_csv, "1,2,3.1\n"
    end
    it "strings" do
      assert_equal [%w[aa cc]].to_deep_csv, "aa,cc\n"
    end
    it "commas" do
      assert_equal [%w[a,a cc]].to_deep_csv, "\"a,a\",cc\n"
    end
    it "headers" do
      assert_equal [%w[aa cc]].to_deep_csv(headers: true, columns: %i[a b]), "a,b\naa,cc\n"
    end
  end

  describe "array of hash" do
    it "numbers" do
      assert_equal [{a: 1, b: 2, c: 3.1}].to_deep_csv, "1,2,3.1\n"
    end
    it "strings" do
      assert_equal [{q: :aa, r: :cc}].to_deep_csv, "aa,cc\n"
    end
    it "headers" do
      assert_equal [{q: :aa, r: :cc}].to_deep_csv(headers: true), "q,r\naa,cc\n"
    end
  end
end
