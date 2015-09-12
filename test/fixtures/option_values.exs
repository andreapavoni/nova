option_types model: Nova.OptionType, repo: Nova.Repo do
  default do
    name Faker.Commerce.product_name_adjective
    display_name "option type"
  end
end

option_values model: Nova.OptionValue, repo: Nova.Repo do
  default do
    name "Some option value"
    display_name "An option value"
    option_type option_types.default
  end

  another do
    name "Another option value"
    display_name "Another option value"
    option_type option_types.default
  end
end
