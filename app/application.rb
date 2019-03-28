class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      #binding.pry
      temp = @@items.find {|element| element.name == item_name}
      if temp != nil
        resp.write temp.price
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
