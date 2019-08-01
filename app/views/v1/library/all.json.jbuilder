json.cache! ['v1', @items] do
  json.array!(@items, :id, :type, :title, :plot)
end
