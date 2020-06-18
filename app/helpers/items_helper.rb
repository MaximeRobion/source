module ItemsHelper

  def format_categories(categories)
    #get all the categories
    #turn each one into a link
    links = categories.map do |cat|
      link_to cat.title, category_path(cat)
    end
    #turn it into a sentence, which is html safe 
    links.to_sentence.html_safe
  end

end
