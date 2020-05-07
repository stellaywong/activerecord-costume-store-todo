require_relative 'spec_helper'

describe "Costume" do

  it "has a name" do
    # binding.pry
    # bundle exec rspec
    # in order to use the equivalent of rails console :)
    # because there's not enough of rails in this project. it's focused on activerecord

    # try costume1 = Costume.new
      # => #<Costume:0x00007f84c40ffd70
      # id: nil,
      # name: nil,
      # price: nil,
      # image_url: nil,
      # size: nil,
      # created_at: nil,
      # updated_at: nil>
    # set costume1.name = "this"
    # set costume1.price = 2
    # costume1.save

    # try costume2 = Costume.create (which is new + save, so you get an id + timestamps off the bat)
      #  id: 2,
      #  name: nil,
      #  price: nil,
      #  image_url: nil,
      #  size: nil,
      #  created_at: 2020-05-07 16:57:30 UTC,
      #  updated_at: 2020-05-07 16:57:30 UTC>
    # or costume2 = Costume.create(name: "costume2", price: 7)
    # try costume2.update(price: 77)
 
    # try Costume.find_by(:name => "costume1") or Costume.find_by(name: "costume1")
    # try Costume.find(#) (the number must be the id #)
    # try Costume.first
    # try Costume.second
    # try Costume.last

    # try testcostume = Costume.first
    # set testcostume.size = 20


    hot_dog = Costume.create(
      name: "Unisex Adult Hot Dog Costume"
    )
    expect(Costume.find_by(name: "Unisex Adult Hot Dog Costume")).to eq(hot_dog)
  end

  it "has a price" do
    pirate = Costume.create(
      name: "Men's Grand Heritage Caribbean Pirate",
      price: 169.97
    )
    expect(Costume.find_by(price: 169.97)).to eq(pirate)
  end

  it "has an image url" do
    url = "http://img.costumecraze.com/images/vendors/rasta/7139-large.jpg"
    penguin = Costume.create(
      name: "Happy Penguin",
      image_url: url
    )
    expect(Costume.find_by(image_url: url)).to eq(penguin)
  end

  it "has a size" do
    horse = Costume.create(
      name: "Horse Mask",
      image_url: "http://a.tgcdn.net/images/products/zoom/ec82_horse_head_mask.jpg",
      size: "medium"
    )
    expect(Costume.find_by(size: "medium")).to eq(horse)
  end

  it "knows when it was created" do
    bee = Costume.create(name: "Dog's Bumble Bee", image_url: "http://cdn.sheknows.com/filter/l/gallery/halloween_costume_dog_bumblebee.jpg",size: "medium")
    expect { bee.created_at }.to_not raise_error
    expect(bee.created_at.to_datetime === Time.now.utc.to_datetime).to eq(true)
  end

  it "knows when it was last updated" do
    stegosaurus = Costume.create(name: "Stegosaurus Tortoise Cozy", image_url: "https://img1.etsystatic.com/036/1/7507736/il_570xN.513886615_45eg.jpg")
    stegosaurus.update(:size => "large")
    expect { stegosaurus.updated_at }.to_not raise_error
    expect(stegosaurus.updated_at.to_datetime ===  Time.now.utc.to_datetime).to eq(true)
    expect(stegosaurus.updated_at.to_datetime).to be > stegosaurus.created_at.to_datetime
  end

end