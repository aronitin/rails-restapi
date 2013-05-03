module GoalsHelper
  def next_page_url(collection)
    unless collection.next_page.nil?
      new_params = {:offset => collection.offset + collection.per_page, :count => collection.per_page}

      string = new_params.map{ |k,v| "#{k}=#{v}" }.join("&")
      request.url.split("?")[0] + "?" + string
    end
  end
  def previous_page_url(collection)
    unless collection.previous_page.nil?
      new_params = {:offset => collection.offset - collection.per_page, :count => collection.per_page}

      string = new_params.map{ |k,v| "#{k}=#{v}" }.join("&")
      request.url.split("?")[0] + "?" + string
    end
  end
end
