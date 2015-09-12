orders model: Nova.Order, repo: Nova.Repo do
  default do
    price Decimal.new(Faker.Commerce.price)
  end
end
