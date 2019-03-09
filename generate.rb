template = File.read("index.html.template")

cover_list_html = Dir["covers/*"].map do |book|
  %(<div><img src="#{book}" alt=""></div>)
end

generated_html = template.sub!("BOOKSGOHERE", cover_list_html.join(""))

File.write("index.html", generated_html)

puts template