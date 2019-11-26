require 'rails_helper'

RSpec.describe "As a user" do
  describe "when i visit any page on the site" do
    describe "i see a header where" do
      it "i can click a link to visit shelters index" do
        visit ("/")
        click_on "All Shelters"
        expect(current_path).to eq("/shelters")


        visit ("/shelters")
        click_on "All Shelters"
        expect(current_path).to eq("/shelters")


        visit ("/pets")
        click_on "All Shelters"
        expect(current_path).to eq("/shelters")
      end

      it "i can click a link to visit pets index" do
        visit ("/")
        click_on "All Pets"
        expect(current_path).to eq("/pets")

        visit ("/shelters")
        click_on "All Pets"
        expect(current_path).to eq("/pets")

        visit ("/pets")
        click_on "All Pets"
        expect(current_path).to eq("/pets")
      end
    end
  end
end
