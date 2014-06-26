<h2>Intialization:</h2>

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
helper = Nretnil::CompendiumAPI::Helpers.new
```

<h2>Functions:</h2>

<h4>Notes:</h4>
- All Dates should be in the ISO8601 Format - 2015-06-26T11:43:00.000Z

<h3>Calendar:</h3>

```ruby

session.calendar.events(start_date,end_date)
session.calendar.add(name,start_date,options = {}) - ex: options = { color => "#00FF00", all_day => true, end_date => "2015-06-26T11:43:00.000Z"}
```

<h3>Category:</h3>

```ruby

session.category.list(options={}) - ex: options = { :NetworkId => 'xxxx-xxxxx-xxxxx-xxxx' }
session.category.add(title,type,options = {})
session.category.edit(title,type)
session.category.delete(category_id)
```

<h3>Comment:</h3>

```ruby

session.comment.list(options={}) - ex: options = { :Count => count }
session.comment.get(comment_id)
session.comment.add(post_id, body, time, name, email, url=nil, options={})
session.comment.approve(comment_ids) - comment_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.comment.decline(comment_ids)
```

<h3>Content:</h3>

```ruby

session.content.list(options={}) - ex: options = { :Page => '1', :Count => '20' , :Status => ["approved"].to_json, :'~Status' => ["deleted"].to_json }
session.content.list_all(options={})
session.content.get(postid)
session.content.add(title,body,slug,publish_date,draft,options) - ex: options = { :Notify => false, :CategoryBlogs => ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
session.content.update(post_id,options)
session.content.delete(postid)
session.content.approve(post_ids,force=false) - ex: post_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.content.decline(post_ids)
```

<h3>Content Groups:</h3>

```ruby
session.content_group.list
session.content_group.get(id)
session.content_group.add(name,config={})
session.content_group.add_item(id,content) - ex: content = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.content_group.edit(id,config) - ex: config = { "content_width" => 500, "character_limit" => 300, "wide_thumbnail_height" => 200, "side_thumbnail_height" => 150, "side_thumbnail_width" => 150, "read_more_text" => "Continue Reading", "read_more_color" => "#000000", "body_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 13, "color" => "#000000" }, "title_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 20, "color" => "#000000"}, "byline_settings" => { "author" => false, "author_title" => false, "date" => false, "italic" => true, "size" => 12 }, "include_social_buttons" => true }
session.content_group.edit_item(group_id, item_id, config)
session.content_group.delete(group_id)
```

<h3>Export:</h3>

```ruby

session.export - returns xml output
```

<h3>Publisher:</h3>

```ruby

session.publisher.list(options={}) - ex: options = { :all => 'true' }
session.publisher.get(publisher_id)
```

<h3>User:</h3>

```ruby

session.user.list(options={}) - ex: options = { :SearchString => search_string }
session.user.get(user_id)
session.user.add(username,firstname,lastname,email)
session.user.edit(id,attributes) - ex: attributes = { :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" }
```

<h3>Helpers:</h3>

```ruby

helper.slugify(title)
```


<h2>Extend Class:</h2>

```ruby

module Nretnil
  module CompendiumAPI

    class Compendium

      def Function(parameter)
        query = { :Parameter => parameter }
        response = Compendium.post('/app/endpoint', :basic_auth => @auth, :body => query)
      end
    
    end

  end
end
```


