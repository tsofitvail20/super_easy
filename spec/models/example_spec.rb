require 'models/example'

describe "An example of equality"  do
  it "show how the equality Matcher work" do
    item1=Example.new("abc",165)
    item2=Example.new("abc",165)
    a=true
    b=false
    expect(item1).to eq item2 #==
    expect(item1).to_not eql item2 #.eql?
    expect(item1).to_not be item2
    expect(item1).to_not equal item2
    expect(item1).to be_instance_of Example
    expect(a).to be_truthy #not false or nil
    expect(b).to be_falsey #false or nil

  end

end