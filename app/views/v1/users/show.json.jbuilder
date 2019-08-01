json.cache! ['v1', @user, 'profile'] do
  json.call(@user, :id, :email)
end
