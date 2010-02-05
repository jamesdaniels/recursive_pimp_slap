require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RecursivePimpSlap" do
  it "should work" do
    {'a' => 2, 'b' => {'a' => 2, 'b' => ['a', 'b', {'a' => 2}]}}.recursive_symbolize_keys.should == {:b=>{:b=>["a", "b", {:a=>2}], :a=>2}, :a=>2}
  end
end
