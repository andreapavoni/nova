option_types model: Nova.OptionType, repo: Nova.Repo do
  default do
    name Faker.Commerce.product_name_adjective
    display_name "option type"
  end
end
