json.cache! ['v1', @movies] do
  json.array!(@movies, :id, :title, :plot)
end
