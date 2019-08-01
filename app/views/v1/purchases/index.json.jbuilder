json.cache! ['v1', current_user, 'purchases'] do
  json.array!(@purchases, :item_id, :expires_at)
end
