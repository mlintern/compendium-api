Intialization:

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)

```

Functions:

Post:

```ruby

session.list_posts(page, search = nil, status = nil)
session.get_post(postid)
session.add_post(title,body,slug,publish_date,draft,options) - options = { :Notify => false, :CategoryBlogs => ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
session.update_post(post_id,options)
session.delete_post(postid)
session.approve_posts(post_ids) - post_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.decline_posts(post_ids)

```

User:

```ruby

session.add_user(username,firstname,lastname,email)
session.edit_user(id,attributes) - attributes = { :firstname => 'Mark', :email => 'lintern.mark@gmail.com' }

```

Comment:

```ruby

session.list_comments(count)
session.add_comment(post_id, body, time, name, email, url, options)
session.approve_comments(comment_ids) - comment_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
session.decline_comments(comment_ids)

```

Category:

```ruby

session.list_categories(network_id = nil)
session.add_manual_category(title,type,network_id = nil)
session.delete_category(category_id)

```



Extend:

```ruby

module Nretnil
  module CompendiumAPI

    class Compendium

      def New Function(parameter)
        query = { :Parameter => parameter }
        response = Compendium.post('/app/endpoint', :basic_auth => @auth, :body => query)
      end
    
    end

  end
end

```


