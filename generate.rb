require "fastimage"

template = File.read("index.html.template")

COLOURS = %w(#ace8dc #b5eecd #b7dbf3 #ddc5e7 #faeba6 #f6d2ae #f8c1ba)

cover_list_html = Dir["covers/*"].map do |book|
  _, height = FastImage.size(book)

  %(<div><img class="lazy" style="width: 300px; height: #{height}px; background: #{COLOURS.sample}" data-src="#{book}" alt=""></div>)
end

generated_html = template.sub!("BOOKSGOHERE", cover_list_html.join("\n"))

File.write("index.html", generated_html)
