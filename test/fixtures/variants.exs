products model: Nova.Product, repo: Nova.Repo do
  base do
    name "A default product name"
    description "Lorem ipsum dolor sit product"
    price Decimal.new(10.50)
    sku "SKU_ABC_123"
  end
end

variants model: Nova.Variant, repo: Nova.Repo do
  base do
    # TODO: remove faker when Decimal scale is fixed
    price Decimal.new(Faker.Commerce.price)
    sku "SKU_ABC_123V"
    product products.base
  end
end
