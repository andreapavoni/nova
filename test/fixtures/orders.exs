orders model: Nova.Order, repo: Nova.Repo do
  default do
    total Decimal.new(0.0)
  end
end
