When('I send a GET request to find all activities') do
  @response = activities.activities_get(@params)
  log(@response.code)
  log(@response.body)
end

Then('the response must be all activities') do
  log('Api is not working') if @response.code != 200
  @response.parsed_response.each do |activity|
    expect(activity["ID"]).to be_a_kind_of(Integer)
    expect(activity["Title"]).to be_a_kind_of(String)
    expect(activity["DueDate"]).to be_a_kind_of(String)
    expect([true, false]).to include(activity["Completed"])
  end 
end

When('I send a POST request to create an activity') do
  @massa_payload = YAML.load_file("C:/git-rep/httparty-ruby-automation/features/support/massa/activities/payload.yml")
  @payload = @massa_payload['create_activity']
  @response = activities.activities_post(@payload)
  log(@response.code)
  log(@response.body)
end

Then('the response must be the new activity') do
  log('Api is not working') if @response.code != 200
  @response.parsed_response do
    expect(["ID"]).to be_a_kind_of(Integer)
    expect(["Title"]).to be_a_kind_of(String)
    expect(["DueDate"]).to be_a_kind_of(String)
    expect([true, false]).to include(activity["Completed"])
  end 
end

When('I send a DELETE request to delete the activity {string}') do |id|
  @response = activities.activities_delete(id)
  log(@response.code)
  log(@response.body)
end

Then('the response must be success') do
  log('Api is not working') if @response.code != 200
end

When('I send a GET request to find the activity {string}') do |id|
  @response = activities.activities_get_id(id)
  log(@response.code)
  log(@response.body)
end

Then('the response must be the activity {int}') do |id|
  log('Api is not working') if @response.code != 200
  log('Response is not OK')  if @response['ID'] != id
  @response.parsed_response do
    expect(["ID"]).to be_a_kind_of(Integer)
    expect(["Title"]).to be_a_kind_of(String)
    expect(["DueDate"]).to be_a_kind_of(String)
    expect([true, false]).to include(activity["Completed"])
  end 
end

When('I send a PUT request to edit the activity {string}') do |id|
  @massa_payload = YAML.load_file("C:/git-rep/httparty-ruby-automation/features/support/massa/activities/payload.yml")
  @payload = @massa_payload['edit_activity']
  @response = activities.activities_put(@payload, id)
  log(@response.code)
  log(@response.body)
end

Then('the response must be the edited activity') do
  log('Api is not working') if @response.code != 200
  @response.parsed_response do
    expect(["ID"]).to be_a_kind_of(Integer)
    expect(["Title"]).to be_a_kind_of(String)
    expect(["DueDate"]).to be_a_kind_of(String)
    expect([true, false]).to include(activity["Completed"])
  end 
end
