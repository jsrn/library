require "fastimage"

template = File.read("index.html.template")

COLOURS = %w(red green blue magenta)

cover_list_html = Dir["covers/*"].map do |book|
  width, height = FastImage.size(book)

  %(<img class="lazy" style="width: #{width}px; height: #{height}px;" data-src="#{book}" alt="">)
end

generated_html = template.sub!("BOOKSGOHERE", cover_list_html.join("\n"))

File.write("index.html", generated_html)
