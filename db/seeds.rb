puts "Clearing existing products..."
Product.destroy_all

puts "Seeding common plant seeds 🧑‍🌾 ..."

seed_products = [
  {
    name: "Tomato Seeds",
    description: "Heirloom cherry tomato seeds. Great for sunny balconies and home gardens.",
    price: 2.99
  },
  {
    name: "Carrot Seeds",
    description: "Sweet and crunchy Nantes carrot seeds. Best grown in deep, loose soil.",
    price: 1.99
  },
  {
    name: "Lettuce Seeds",
    description: "Mixed salad greens. Quick to germinate and perfect for container gardens.",
    price: 2.49
  },
  {
    name: "Cucumber Seeds",
    description: "Fast-growing slicing cucumbers. Ideal for trellises or ground planting.",
    price: 2.79
  },
  {
    name: "Sunflower Seeds",
    description: "Tall, bright yellow sunflowers. Attracts pollinators and birds.",
    price: 1.50
  },
  {
    name: "Zinnia Seeds",
    description: "Colorful summer blooms that thrive in full sun. Easy to grow.",
    price: 1.99
  },
  {
    name: "Basil Seeds",
    description: "Classic sweet basil for cooking. Grows well in pots and kitchen gardens.",
    price: 2.25
  },
  {
    name: "Parsley Seeds",
    description: "Flat-leaf parsley seeds. Hardy and flavorful herb for all seasons.",
    price: 2.00
  },
  {
    name: "Spinach Seeds",
    description: "Nutrient-rich leafy green that grows quickly in cool weather.",
    price: 2.35
  },
  {
    name: "Green Bean Seeds",
    description: "High-yield bush green beans. Crisp and perfect for home harvests.",
    price: 2.95
  }
]

seed_products.each do |product|
  Product.create!(product)
  # sleep 5
end

puts "Seed products created: #{Product.count}"
