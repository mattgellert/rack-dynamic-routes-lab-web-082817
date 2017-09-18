require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #binding.pry
    search_item = ""
    search_price = ""

    if req.path.match(/items/)
      search_term = req.path.split("/")[-1]
      @@items.each do |item|
        if item.name == search_term
          search_item = search_term
          search_price = item.price
        end
      end
      if search_term == search_item
        resp.write "#{search_term} costs #{search_price}"
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
