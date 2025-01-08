require "fastimage"
require "stringio"

template = File.read("index.html.template")

COLOURS = %w(red green blue magenta)

total_size = 0

cover_list_html = Dir["covers/*"].sort.map do |book|
  width, height = FastImage.size(book)

  %(<img loading="lazy" style="width: #{width}px; height: #{height}px;" src="#{book}" alt="">)
end

generated_html = template.sub("BOOKSGOHERE", cover_list_html.join("\n"))

File.write("index.html", generated_html)
