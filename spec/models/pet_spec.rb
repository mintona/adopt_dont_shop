require 'rails_helper'

describe Pet, type: :model do
  describe "validations" do
    it { should validate_presence_of :image}
    it { should validate_presence_of :name}
    it { should validate_presence_of :approximate_age}
    it { should validate_presence_of :sex}
    it { should validate_presence_of :shelter}
  end

  describe "model methods" do
    it "can count total pets" do
      expect(Pet.pet_count).to eq(0)
      
      @shelter_1 = Shelter.create(name: "Boulder Shelter",
                                  address: "123 Arapahoe Ave",
                                  city: "Boulder",
                                  state: "CO",
                                  zip: "80301")

      @image = "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg"
      @description = "I am a loveable, snuggly, cat! If you are anti-snuggle, look elsewhere. I want to be pet at all times!"
      @name = "Alex"
      @age = "10"
      @sex = "Male"
      @pet_1 = @shelter_1.pets.create!(name: @name,
                                      image: @image,
                                      approximate_age: @age,
                                      sex: @sex,
                                      description: @description)

      peacock_image = "https://images.pexels.com/photos/45911/peacock-plumage-bird-peafowl-45911.jpeg"
      @peacock = @shelter_1.pets.create!(name: "Pea",
                                        approximate_age: "1.5",
                                        sex: "Male",
                                        description: "I'm a peacock!",
                                        image: peacock_image)

      expect(Pet.pet_count).to eq(2)
    end

  end


end
