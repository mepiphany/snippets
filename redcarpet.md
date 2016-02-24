1. Install gemfile
  - gem "redcarpet"
  - run bundle command
2. in the content that you wish to implement
  - <%= Redcarpet.new(@article.content).to_html %>
3. inside the application helper
```ruby
  def markdown()

  Redcarpet.new(test).to_html.html_safe

  end
```
