require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    req_1 = req.path.split("/")[1]
    req_2 = req.path.split("/")[2]


    if req_1.match(/items/)
      # binding.pry
      if Item.all.find {|i| i.name == req_2}
        resp.write "#{item_prize(req_2).price}"
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

  def item_prize(item)
    Item.all.find {|i| i.name == item}
  end



end
