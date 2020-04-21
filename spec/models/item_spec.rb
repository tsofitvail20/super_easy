require 'rails_helper'

RSpec.describe Item, type: :model do
  context "When testing the Item class" do
    it "is valid with valid attributes" do
      item={:id=> 165,:name=> "ads",  :created_at=> "2020-04-19 11:40:59", :updated_at=> "2020-04-19 11:40:59"}
      expect(Item.new(item)).to be_valid
    end

  end
end
