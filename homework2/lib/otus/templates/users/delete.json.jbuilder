# TODO: create shared template

if result
  json.status "success"
  json.data nil
else
  json.status "fail"
  json.message "User not found"
end
