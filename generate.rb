require "fastimage"

template = File.read("index.html.template")

cover_list_html = Dir["covers/*"].map do |book|
  _, height = FastImage.size(book)

  %(<div><img class="lazy" style="min-width: 300px; min-height: #{height}px;" data-src="#{book}" alt=""></div>)
end

generated_html = template.sub!("BOOKSGOHERE", cover_list_html.join("\n"))

File.write("index.html", generated_html)
