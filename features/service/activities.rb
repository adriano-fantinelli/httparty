module Activities
  class Rest
    include HTTParty

    base_uri URL[AMBIENTE]['fake-rest-api'] + ENDPOINT['activities']
    def activities_get(params)
      response = self.class.get("",
                                headers: {
                                  'Content-Type' => 'application/json'
                                })
      response
    end

    def activities_post(payload)
      response = self.class.post("",
                                 body: JSON.pretty_generate(payload),
                                 headers: {
                                  'Content-Type' => 'application/json'
                                 })
      response
    end

    def activities_delete(id)
      response = self.class.delete("/"+ id,
                                   headers: {
                                    'Content-Type' => 'application/json'
                                   })
      response
    end

    def activities_get_id(id)
      response = self.class.get("/" + id,
                                headers: {
                                  'Content-Type' => 'application/json'
                                })
    end

    def activities_put(payload, id)
      response = self.class.post("/" + id,
                                 body: JSON.pretty_generate(payload),
                                 headers: {
                                  'Content-Type' => 'application/json'
                                 })
      response
    end
  end
end