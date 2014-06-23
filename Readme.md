<h2>Intialization:</h2>

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
helper = Nretnil::CompendiumAPI::Helpers.new
```

<h2>Functions:</h2>

<h3>Category:</h3>

```ruby

session.category.list(options={}) - options = { :NetworkId => 'xxxx-xxxxx-xxxxx-xxxx' }
session.category.add(title,type,options = {})
session.category.edit(title,type)
session.category.delete(category_id)
```

<h3>Comment:</h3>

```ruby

session.comment.list(options={}) - options = { :Count => count }
session.comment.get(comment_id)
session.comment.add(post_id, body, time, name, email, url=nil, options={})
session.comment.approve(comment_ids) - comment_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.comment.decline(comment_ids)
```

<h3>Content:</h3>

```ruby

session.content.list(options={}) - options = { :Page => '1', :Count => '20' , :Status => ["approved"].to_json, :'~Status' => ["deleted"].to_json }
session.content.get(postid)
session.content.add(title,body,slug,publish_date,draft,options) - options = { :Notify => false, :CategoryBlogs => ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
session.content.update(post_id,options)
session.content.delete(postid)
session.content.approve(post_ids,force=false) - post_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.content.decline(post_ids)
```

<h3>Publisher:</h3>

```ruby

session.publisher.list(options={}) - options = { :all => 'true' }
```

<h3>User:</h3>

```ruby

session.user.list(options={}) - options = { :SearchString => search_string }
session.user.get(user_id)
session.user.add(username,firstname,lastname,email)
session.user.edit(id,attributes) - attributes = { :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com" }
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


