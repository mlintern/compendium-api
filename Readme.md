<h2>Intialization:</h2>

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
helper = Nretnil::CompendiumAPI::Helpers.new
```

<h2>Functions:</h2>

<h3>Content:</h3>

```ruby

session.list_content(options) - options = { :Page => '1', :Count => '20' , :Status => ["approved"].to_json, :'~Status' => ["deleted"].to_json }
session.get_content(postid)
session.add_content(title,body,slug,publish_date,draft,options) - options = { :Notify => false, :CategoryBlogs => ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
session.update_content(post_id,options)
session.delete_content(postid)
session.approve_content(post_ids) - post_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.decline_content(post_ids)
```

<h3>User:</h3>

```ruby

session.list_users(options) - options = { :SearchString => search_string }
session.add_user(username,firstname,lastname,email)
session.edit_user(id,attributes) - attributes = { :firstname => 'Mark', :email => 'lintern.mark@gmail.com' }
```

<h3>Comment:</h3>

```ruby

session.list_comments(options) - options = { :Count => count }
session.add_comment(post_id, body, time, name, email, url, options)
session.approve_comments(comment_ids) - comment_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.decline_comments(comment_ids)
```

<h3>Category:</h3>

```ruby

session.list_categories(options) - options = { :NetworkId => 'xxxx-xxxxx-xxxxx-xxxx' }
session.add_category(title,type,options)
session.delete_category(category_id)
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


