Intialization:

Compendium.new(user, key, server)

Functions:

Post:

list_posts(page, search = nil, status = nil)
get_post(postid)
add_post(title,body,url,publish_date,draft,optional) - optional = { :Notify => false, :CategoryBlogs => ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"].to_json, :Publisher => 'xxxx-xxxx-xxxx-xxxx' }
update_post(post_id,title,body,url,publish_date,draft,optional)
delete_post(postid)
approve_posts(post_ids) - post_ids = ["xxxxx-xxxxx-xxxx-xxxx","xxxxx-xxxx-xxxx-xxxx"]
decline_posts(post_ids)

User:

add_user(username,firstname,lastname,email)
edit_user(id,attributes) - attributes = { :firstname => 'Mark', :email => 'lintern.mark@gmail.com' }
