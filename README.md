<h2>Version: 0.19.1</h2>

[See Examples Here](examples)

<h2>Public Endpoints</h2>

* [Public Feed Content](#pub_content)

<h2>Auth Endpoints</h2>

* [Apps](#apps)
* [App Providers](#app_providers)
* [Business Units](#bus)
* [Calendar](#calendar)
* [Calendar Views](#calendar_views)
* [Callback](#callback)
* [Categories](#categories)
* [Comments](#comments)
* [Content](#content)
* [Content Groups](#content_groups)
* [Content Types](#content_types)
* [Custom Fields](#custom_fields)
* [Languages](#languages)
* [Personas](#personas)
* [Post Task](#post-task)
* [Projects](#projects)
* [Publishers](#publishers)
* [Roles](#roles)
* [Users](#users)
* [Workflow](#workflow)
* [Workflow Stage](#workflow-stage)
* [Workflow Task](#workflow-task)

<h2>Misc</h2>

* [Top Level Methods](#top_level)
* [Helpers](#helpers)
* [Environment Variables](#env)
* [Extend Class](#extend)

<h1>Initialization:</h1>

```ruby

session = Nretnil::CompendiumAPI::Compendium.new(user, key, server)
public = Nretnil::CompendiumAPI::CompendiumPublic.new(server)
```

<h1>Public Endpoints</h1>

<h3 id="pub_content">Public Feed Content:</h3>
<h5>Slimmed down version of the content endpoint for quickly getting post information.</h5>

```ruby

public.content.list(publisher_id, options = {}) - ex: options = { :page_size => 5, :page => 2, :categories => ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"], :content_type => "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", :include_fields => ["FIELD_ID_1","FIELD_ID_2"].to_json }
public.content.get(publihser_id, content_id, options = {}) - ex: options = { :include_fields => ["FIELD_ID_1","FIELD_ID_2"].to_json }
```

```
List

[
    {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "title": "Pink Panthers?",
    "featured_image": "https://cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/55c46573-c3f0-4138-b3a6-a5d67dce9f57/Image/0ebad7db1649a865c4ac4b703e4071c5/pink_panther_images_w1024.gif",
    "publish_date": "2014-09-08T16:49:00+00:00",
    "web_url": "http://pink.compendiumblog.com.dev.compendiumblog.com/pink-panthers",
    "asset_url": "http://dev.compendiumblog.com/api/publishers/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/feed/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "categories": [
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Twitter"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Dessert"
      },
      ...
    ],
    "content_type": {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Image Post"
    },
    "author": {
      "name": "Madeline Weston"
    }
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "title": "Styling",
    "featured_image": "https://cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/39065ec1-4d23-457a-bf18-ea21d1293d1d/Image/9b49893c6abf607a1b108c7ba6c0bccc/pinkheel.jpg",
    "publish_date": "2014-08-28T17:48:02+00:00",
    "fields": {
      "FIELD_ID_1": "0",
      "FIELD_ID_2": "Chocolate"
    },
    "web_url": "http://pink.compendiumblog.com.dev.compendiumblog.com/styling",
    "asset_url": "http://dev.compendiumblog.com/api/publishers/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/feed/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "categories": [

    ],
    "content_type": {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Text Post"
    },
    "author": {
      "name": "Fiona Glennanne"
    }
  },
  ...
]

get

{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "title": "Pink Panthers?",
  "body": "<p>Du nu nu nu...da nu...da nu da nu da nu da nu da nuuuuuuuuu. da na na na na naaaa na</p>\n",
  "featured_image": "https://cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/55c46573-c3f0-4138-b3a6-a5d67dce9f57/Image/0ebad7db1649a865c4ac4b703e4071c5/pink_panther_images_w1024.gif",
  "publish_date": "2014-09-08T16:49:12+00:00",
  "fields": {
    "Favorite_Colors": "",
    "Little_Something_Extra": null,
    "Email_Address": "",
    "Success_Grade": "Select Success Grade",
    "Must_Read": "0",
    "Shoe_Size": "1-5",
    "First_Name": "",
    "Top_Secret": "0",
    "Last_Name": "",
    "Sport": "Non Athletic",
    "Ice_Cream": "Chocolate"
  },
  "web_url": "http://pink.compendiumblog.com.dev.compendiumblog.com/pink-panthers",
  "categories": [
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Twitter"
    },
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Dessert"
    },
    ...
  ],
  "author": {
    "name": "Madeline Weston"
  },
  "content_type": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Image Post"
  }
}

```

<h1>Authenticated Endpoints</h1>

<h4>Notes:</h4>
- All Dates should be in the ISO8601 Format - 2015-06-26T11:43:00.000Z

<h3 id="apps">Apps:</h3>
<h5>Create, Get, Edit Business Units.</h5>

```ruby

session.app.list
session.app.get(app_id)
session.app.add(name,options = {}) - ex: options = { :published => true, :disabled => false, :install_url => "https://path.to.install/url", :configuration_url => "https://path.to.config/url", :description => "Sed viverra augue tellus nulla sollicitudin scelerisque.", :uninstall_url => "https://path.to.uninstall/url" }
session.app.extension(app_id, options = {}) - ex: options = { :label => "App Extension", :schema => "content_provider", :type => "translation_provider", :disabled => "false", :CREATE_PROJECT => "http://app.nretnil.com/translator/create_project", :ADD_SOURCE => "http://app.nretnil.com/translator/add_source", :PROJECT_CANCELLED => "http://app.nretnil.com/translator/project_canceled", :GET_OPEN_PROJECTS => "http://app.nretnil.com/translator/get_open_projects" }
session.app.edit(id,options)
session.app.delete(app_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "app_name": "Tester Application",
  "app_description": "App will tranlsoation content into Pig Latin.",
  "install_url": "http://app.nretnil.com/api/translator/install",
  "configuration_url": "http://app.nretnil.com/translator/configure",
  "uninstall_url": "http://app.nretnil.com/api/translator/uninstall",
  "disabled": false,
  "create_date": "2016-03-14T14:28:43+00:00",
  "app_provider_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "decoded_install_url": "http://app.nretnil.com/api/translator/install",
  "decoded_configuration_url": "http://app.nretnil.com/translator/configure",
  "decoded_uninstall_url": "http://app.nretnil.com/api/translator/uninstall",
  "published": false,
  "extensions": [
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "type": "translation_provider",
      "schema": "content_provider",
      "label": "Tester Application",
      "create_date": "2016-03-14T14:28:43+00:00",
      "disabled": false,
      "services": {
        "CREATE_PROJECT": "http://app.nretnil.com/translator/create_project",
        "ADD_SOURCE": "http://app.nretnil.com/translator/add_source",
        "PROJECT_CANCELLED": "http://app.nretnil.com/translator/project_canceled",
        "GET_OPEN_PROJECTS": "http://app.nretnil.com/translator/get_open_projects"
      }
    }
  ]
}
```

<h3 id="app_providers">App Providers:</h3>
<h5>Create, Get, Edit Business Units.</h5>

```ruby

session.app_provider.list
session.app_provider.get(provider_id)
session.app_provider.add(name,options = {}) - ex: options = { :icon_link => "http://www.domaintolink.com/img/icon.jpg", :provider_email => "example@email.com" }
session.app_provider.edit(id,options)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "provider_name": "Nretnil Apps",
  "provider_email": "fakeemail@notrealdomain.com",
  "create_date": "2016-03-01T19:07:53+00:00",
  "icon_link": "http://dev.nretnil.com/gif/square-giphy.gif"
}
```

<h3 id="bus">Business Units:</h3>
<h5>Create, Get, Edit Business Units.</h5>

```ruby

session.bu.list(options = {})
session.bu.add(name,publisher_ids,options = {})
session.bu.edit(id,options)
```

```
 {
  "business_unit_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "New BU",
  "is_default": false,
  "enabled": true,
  "initial_bu": false,
  "default_publisher_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "default_language_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "publishers": [
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  ]
}
```

<h3 id="calendar">Calendar:</h3>
<h5>Create, Get and Delete Calender Events.</h5>

```ruby

session.calendar.events(start_date,end_date)
session.calendar.add(name,start_date,options = {}) - ex: options = { :color => "#00FF00", :all_day => true, :end_date => "2015-06-26T11:43:00.000Z" }
session.calendar.delete(event_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Now",
  "description": "api calendar event",
  "color": "#abc123",
  "all_day": false,
  "start_date": "2014-07-03 12:14:37 UTC",
  "end_date": null,
  "icon": "fa-clock-o"
}
```

<h3 id="calendar_views">Calendar Views:</h3>
<h5>Get, Create, Edit and Delete Calender Views.</h5>

```ruby

session.calencar_view.list(options = {})
session.calencar_view.assigned(options = {})
session.calencar_view.get(id)
session.calencar_view.add(name, options = {}) - ex: options = { filter_state: { "status": ['Draft'] }, assignees: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx','xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx','xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'] }
session.calencar_view.edit(id, options)
session.calencar_view.unassign(id)
session.calencar_view.delete(id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "View One",
  "filter_state": {
    "status": "All",
    "post_type": "All",
    "query": "",
    "social": [

    ],
    "author": "All",
    "category": "All",
    "persona": "All",
    "funnel_stage": "All",
    "entry_types": [
      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    ],
    "campaign": [

    ],
    "custom_tags": "",
    "custom_tag_filters": null,
    "num_custom_tags": 0,
    "publisher": [
      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    ],
    "awaiting_user": "All",
    "language": "All",
    "asset_state": "All",
    "date_range_filter": {
    },
    "contacts": [

    ],
    "task_deadline_filter": {
    },
    "sort": "Publish Date",
    "filter_key": "",
    "filter_val": ""
  },
  "owner_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "assignees": [
    {
      "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Author 0"
    },
    {
      "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Author 1"
    },
    ...
    {
      "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Author X"
    }
  ]
}
```

<h3 id="callback">Callback:</h3>

```ruby

session.callback.fire(name, arguments = {}, network_id = nil, schedule_at = nil) - ex: arguments = { :foo => bar, :baz => bos }
session.callback.list
```

<h3 id="categories">Categories:</h3>

```ruby

session.category.list(options = {}) - ex: options = { :NetworkId => 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' }
session.category.add(title,type,options = {})
session.category.edit(title,type)
session.category.delete(category_id)
```

```
{
  "BlogId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "NetworkId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "CategoryId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "Type": "comp",
  "Title": "Biking",
  "Description": "Nature - Blog:Biking",
  "UrlToken": "biking",
  "Url": "http://www.nature.com/biking",
  "PostCount": "3",
  "ParentId": null,
  "Children": [

  ],
  "Attributes": {
    "Tags": [
      "Biking"
    ]
  }
}
```

<h3 id="comments">Comments:</h3>

```ruby

session.comment.list(options = {}) - ex: options = { :Count => count }
session.comment.list_all(options = {})
session.comment.get(comment_id)
session.comment.add(post_id, body, time, name, email, url=nil, options = {})
session.comment.approve(comment_ids) - comment_ids = ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]
session.comment.decline(comment_ids)
```

```
{
  "CommentId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "Title": "Great Post Man!",
  "PostAuthorId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "CreatorName": "John Smith",
  "CreatorEmail": "jsmith@gmail.com",
  "CreationTimestamp": "2014-07-02T20:38:37+00:00",
  "Status": "approved"
}
```

<h3 id="content">Content:</h3>

```ruby

session.content.list(options = {}) - ex: options = { :Page => '1', :Count => '20' , :Deleted => 'all', :PublishStartDate => start_date, :PublishEndDate => end_date }
session.content.list_all(options = {},debug=false) - ex: options = { :is_live => true, :Stage => ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"].to_json }
session.content.get(postid)
session.content.add(author_id, title, body, content_type_id, options = {}) - ex: options = { :publish_date => "2015-01-01T00:00:00+00:00", :url_lookup_token => slug, :BlogIds => ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"].to_json, :Publisher => 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx', :CustomProperties => [{ :FieldId => Favorite_Color, :Value => 'Green', :MultiValued => false },{ :FieldId => Ice_Cream, :Value => 'Vanilla', :MultiValued => false }].to_json }
session.content.idea(title,slug,options = {})
session.content.update(post_id,options) = ex: options = { :post_title => "API Updated Title" }
session.content.delete(postid)
session.content.take_down(post_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "description": "Spying",
  "funnel_stage": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "post_status": "approved",
  "url": "/app/post/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "post_date": "2014-04-02 20:33:13 +0000",
  "persona_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "campaign_id": null,
  "content_type_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "url_lookup_token": "spying",
  "post_text": "Espionage or spying involves a government or individual obtaining information considered secret or confidential without the permission of the holder of the information.[1] Espionage is inherently clandestine, as it is taken for granted that it is unwelcome and, in many cases illegal and punishable by law. It is a subset of intelligence gathering, which otherwise may be conducted from public sources and using perfectly legal and ethical means. It is crucial to distinguish espionage from intelligence gathering, as the latter does not necessarily involve espionage, but often collates open-source information.\nEspionage is often part of an institutional effort by a government or commercial concern. However, the term is generally associated with state spying on potential or actual enemies primarily for military purposes. Spying involving corporations is known as industrial espionage.\nOne of the most effective ways to gather data and information about the enemy (or potential enemy) is by infiltrating the enemy's ranks. This is the job of the spy (espionage agent). Spies can bring back all sorts of information concerning the size and strength of an enemy army. They can also find dissidents within the enemy's forces and influence them to defect. In times of crisis, spies can also be used to steal technology and to sabotage the enemy in various ways. Counterintelligence operatives can feed false information to enemy spies, protecting important domestic secrets, and preventing attempts at subversion. Nearly every country has very strict laws concerning espionage, and the penalty for being caught is often severe. However, the benefits that can be gained through espionage are generally great enough that most governments and many large corporations make use of it to varying degrees.\nFurther information on clandestine HUMINT (human intelligence) information collection techniques is available, including discussions of operational techniques, asset recruiting, and the tradecraft used to collect this information. zany",
  "edited_post_text": "",
  "edited_post_title": "",
  "admin_feedback": "",
  "sticky": false,
  "web_url": "http://www.marklintern.com/successbucket/ch%cc%85%cc%92%cd%a5%cd%a7%cd%87%cc%ac%cd%94%cc%b3%cc%96e%cc%8c%cd%82%cd%86%cd%8a%cc%a3%cc%96%cd%87%cd%88%cd%8d%cc%b1%cc%ad_c%cd%88om%cd%84%cd%9b%cc%88%cd%a9%cd%90%cd%8a%cd%a6%cc%b1e%cd%a8%cc%93%cc%90s%cd%8a%cc%86%cc%91%cd%84",
  "is_live": false,
  "is_published": true,
  "featured_image": "//cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/2be5833d-4622-4ecf-aae1-58b4c227c2a0/Image/c314623dd8f376f1eaf43ce6e6b98fbd/buff_chick_wrap.jpg",
  "meta_description": null,
  "custom_title": null,
  "best_practice_score": 75,
  "keyword_strength": 0.0,
  "revision_number": 22,
  "network_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "publish_date": "2014-04-02T16:33:00-04:00",
  "edited_publish_date": null,
  "topic_category_id": null,
  "BlogIds": [
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    ...
  ],
  "publisher": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "SuccessBucket",
    "offline": false,
    "remote": false,
    "remote_state": "synced",
    "publisher_type": "compendium",
    "sync_stamp": "2014-06-11 21:12:35 +0000"
  },
  "current_moderator": "",
  "user": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Michael Weston",
    "url": "/app/user/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "mweston"
  },
  "blog": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "short_name": "Planes Trains and Spies"
  },
  "CustomProperties": [
    {
      "FieldId": "Favorite_Colors",
      "Value": "[\"Red\",\"Orange\",\"Green\",\"Indigo\"]",
      "MultiValued": true
    },
    {
      "FieldId": "Ice_Cream",
      "Value": "Vanilla",
      "MultiValued": false
    },
    {
      "FieldId": "Top_Secret",
      "Value": "1",
      "MultiValued": false
    }
  ],
  "primary_attachment": null,
  "post_stage": {
    "name": "Complete",
    "color": "15ac57",
    "stage_type": "complete",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
}
```

<h3 id="content_groups">Content Groups:</h3>

```ruby
session.content_group.list
session.content_group.get(id)
session.content_group.add(name,config = {})
session.content_group.add_item(id,content) - ex: content = ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]
session.content_group.edit(id,config) - ex: config = { "content_width" => 500, "character_limit" => 300, "wide_thumbnail_height" => 200, "side_thumbnail_height" => 150, "side_thumbnail_width" => 150, "read_more_text" => "Continue Reading", "read_more_color" => "#000000", "body_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 13, "color" => "#000000" }, "title_settings" => { "font" => "'Trebuchet MS', Helvetica, sans-serif", "size" => 20, "color" => "#000000"}, "byline_settings" => { "author" => false, "author_title" => false, "date" => false, "italic" => true, "size" => 12 }, "include_social_buttons" => true }
session.content_group.edit_item(group_id, item_id, config)
session.content_group.delete(group_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "API Group",
  "create_date": "2014-07-02T17:00:47+00:00",
  "url": "/api/content_groups/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "config": {
    "content_width": 500,
    "character_limit": 300,
    "wide_thumbnail_height": 200,
    "side_thumbnail_height": 150,
    "side_thumbnail_width": 150,
    "read_more_text": "Continue Reading",
    "read_more_color": "#000000",
    "body_settings": {
      "font": "'Trebuchet MS', Helvetica, sans-serif",
      "size": 13,
      "color": "#000000"
    },
    "title_settings": {
      "font": "'Trebuchet MS', Helvetica, sans-serif",
      "size": 20,
      "color": "#000000"
    },
    "byline_settings": {
      "author": false,
      "author_title": false,
      "date": false,
      "italic": true,
      "size": 12
    },
    "include_social_buttons": true
  },
  "items": [
    {
      "post_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "sort_order": 0,
      "config": {
        "layout": "left_thumbnail"
      }
    },
    {
      "post_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "sort_order": 1,
      "config": {
        "layout": "left_thumbnail"
      }
    },
    {
      "post_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "sort_order": 2,
      "config": {
        "layout": "right_thumbnail"
      }
    },
    {
      "post_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "sort_order": 3,
      "config": {
        "layout": "left_thumbnail"
      }
    }
  ],
  "user": {
    "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "mweston",
    "url": "/app/user/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
  "network": {
    "network_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "company_name": "Test - ML"
  }
}
```

<h3 id="content_types">Content Types</h3>

```ruby
session.content_type.list
session.content_type.get(id)
session.content_type.add(name,config = {},options = {}) - ex: config = { :content_score => false, :related_content => true }
session.content_type.edit(id,config,options) - ex: options = { :icon => 'fa-cloud-upload', :primary_editor => 'image' }
session.content_type.delete(id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "API Content Type",
  "primary_editor": "rich_text",
  "landing_page": false,
  "config": {
    "related_content": true,
    "content_score": false
  },
  "deleted": false,
  "network_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "icon": "fa-cloud-upload"
}
```

<h3 id="custom_fields">Custom Fields:</h3>

```ruby
session.custom_field.list
session.custom_field.get(custom_field_id = "")
session.custom_field.add(label, field_id, options = {}) - ex: options = { :type => "predefined", :options => ["Red","White","Blue"] }
session.custom_field.edit(id, options = {}) - ex: options = { :visibility => "advanced", :field_id => Time.new.to_i, :type => "multi-predefined", :options => ["Red","White","Blue","Purple"] }
session.custom_field.delete(custom_field_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "label": "Favorite Colors",
  "field_id": "Favorite_Colors",
  "type": "multi-predefined",
  "visibility": "below",
  "network_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "created_at": null,
  "updated_at": "2014-06-11T21:13:33+00:00",
  "field_order": 4,
  "options": [
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Blue",
    "Indigo",
    "Violet",
    "Black",
    "White"
  ],
  "content_type_filter": [

  ]
}
```

<h3 id="export">Export:</h3>

```ruby

session.export - returns xml output
```

<h3 id="languages">Languages:</h3>
<h5>Create, Get, Edit, Delete Lanugages.</h5>

```ruby

session.language.list
session.language.add(name,code)
session.language.edit(id,options)
session.language.delete(id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Test",
  "code": "TE",
  "default_on_business_units": [
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  ]
}
```

<h3 id="personas">Personas:</h3>
<h5>Create, Get, Edit, Delete Personas.</h5>

```ruby

session.persona.list
session.persona.add(name,options = {})
session.persona.edit(id,options)
session.persona.delete(id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Jane Doe",
  "role": "User",
  "fears": "",
  "challenges": "",
  "goals": "",
  "title": "",
  "company_size": "",
  "industry": null,
  "income": "",
  "age": "",
  "education": "",
  "additional_info": "",
  "photo_url": "https://dev.cpdm.oraclecorp.com/images/person-none.png",
  "preferred_content_types": "",
  "preferred_channels": "",
  "persona_stages": [
    {
      "description": "",
      "funnel_stage": {
        "stage_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "stage_name": "Awareness",
        "stage_order": 1
      }
    },
    {
      "description": "",
      "funnel_stage": {
        "stage_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "stage_name": "Consideration",
        "stage_order": 2
      }
    },
    {
      "description": "",
      "funnel_stage": {
        "stage_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "stage_name": "Inquiry",
        "stage_order": 3
      }
    },
    {
      "description": "",
      "funnel_stage": {
        "stage_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "stage_name": "Purchase",
        "stage_order": 4
      }
    },
    {
      "description": "",
      "funnel_stage": {
        "stage_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "stage_name": "Retention",
        "stage_order": 5
      }
    }
  ],
  "eloqua_segment": null,
  "business_unit": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

<h3 id="post-tasks">Post Tasks:</h3>

```ruby

session.post_task.list(post_id)
session.post_task.get_current_task(post_id)
session.post_task.my_current_tasks()
session.post_task.complete(task_id)
session.post_task.uncomplete(task_id)
session.post_task.add(title, post_id, stage_id, options = {})
session.post_task.delete(task_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "description": "Add 500 Words",
  "note": "",
  "task_type": "todo",
  "task_order": 0,
  "deadline_period": -1,
  "deadline": null,
  "completed": false,
  "overdue": false,
  "edit_policy": "once",
  "current": true,
  "last_completed_at": null,
  "last_uncompleted_at": null,
  "required": true,
  "completable": true,
  "stage": {
    "name": "Creative",
    "color": "cd00ff",
    "order": 2,
    "type": "prepublication",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
  "workflow": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Text",
    "active": true
  },
  "assignees": [
    {
      "assignee_type": "author",
      "user_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Mark User"
    }
  ]
}
```

<h3 id="projects">Projects:</h3>
<h5>Create, Get, Edit, Delete Projects.</h5>

```ruby

session.project.list
session.project.get(id)
session.project.add(name,options = {})
session.project.edit(id,options)
session.project.delete(id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "total_content": 0,
  "total_content_complete": 0,
  "parent_id": null,
  "name": "Test Project",
  "description": null,
  "color": null,
  "calendar": false,
  "all_business_units": true,
  "start_date": null,
  "end_date": null,
  "business_unit": [
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  ]
}
```


<h3 id="publishers">Publishers:</h3>

```ruby

session.publisher.list(options = {}) - ex: options = { :all => 'true' }
session.publisher.get(publisher_id)
session.publisher.add(name,hostname,options = {})
session.publisher.edit(publisher_id,config = {})
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "publisher_name": "Blue Stuff",
  "publisher_type": "compendium",
  "hostname": "blog.blue.com",
  "uri_base": "/goo",
  "template_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "uri_pattern": "flex",
  "render_engine": "twig",
  "start_page_ui_type": "uber",
  "start_page_ui_id": "",
  "start_page_type": "list",
  "start_page_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "publisher_title": "BLUE GOO",
  "page_title_format": "SHORT",
  "props": {
    "postsPerPage": "5",
    "previewLen": "500",
    "readMore": "Read More » »",
    "truncate": "false"
  }
}
```


<h3 id="roles">Roles:</h3>

```ruby

session.role.list(options = {})
session.role.add(name,permissions) - ex: permissions = [{:id => "categories.manage.network"},{:id => "campaigns.manage.network"},{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"},{:id => "analytics.read.self"}]
session.role.edit(role_id,options) - ex: options = { :name => "Role Name", permissions => [{:id => "categories.manage.network"},{:id => "campaigns.manage.network"},{:id => "assignments.manage.network"},{:id => "topics.manage.network"},{:id => "content_types.manage.network"},{:id => "design.manage.network"},{:id => "redirects.manage.network"},{:id => "content.promote.network"},{:id => "contentbuckets.manage.self"},{:id => "analytics.read.self"}]}
session.role.assign(user_id,roles) - ex: roles = ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"]
session.role.delete(role_id)
```

```
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Author",
  "deleted": false,
  "network_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "permissions": [
    {
      "id": "content.update.self"
    },
    {
      "id": "topicmodeling.manage.network",
      "target": {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "API Network"
      }
    },
    {
      "id": "content.delete.self"
    },
    {
      "id": "blog.update.self"
    },
    {
      "id": "contentbuckets.manage.self"
    },
    {
      "id": "content.promote.self"
    },
    {
      "id": "analytics.read.self"
    },
    {
      "id": "content.create.self"
    },
    {
      "id": "content.read.self"
    },
    {
      "id": "idea.update.network",
      "target": {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "API Network"
      }
    },
    {
      "id": "comments.manage.self"
    },
    {
      "id": "storycapture.create.self"
    }
  ]
}
```

<h3 id="users">Users:</h3>

```ruby

session.user.list(options = {}) - ex: options = { :disabled => true }
session.user.get(user_id="")
session.user.add(username,firstname,lastname,email,options = {}) - ex: options = { :BusinessUnits => ["xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx","xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"] }
session.user.edit(id,attributes) - ex: attributes = { :FirstName => "Johnathon", :EmailAddress => "jsmith@live.com", :BlogTitle => 'John Smith', :Timezone => 'America/Indianapolis' }
```

```
{
  "Success": {
    "UserId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "UserName": "mweston",
    "FirstName": "Michael",
    "LastName": "Weston",
    "EmailAddress": "mweston@usa.com",
    "Roles": [
      {
        "Id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "Name": "Author"
      },
      {
        "Id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "Name": "Administrator"
      }
    ],
    "BlogTitle": "Spy Games",
    "BlogDescription": null,
    "BlogUrl": "http://www.usa.com/blog/spygames",
    "Timezone": "America/Indianapolis",
    "RemoteKey": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "ApplicationEmailAddress": "fdas534hhvf@compend.me",
    "Status": "Enabled",
    "CategoryBlogIds": [

    ],
    "Website": "www.mweston.com",
    "Facebook": "facebook.com/mweston",
    "Twitter": "mweston",
    "GooglePlus": "google.com/mweston",
    "LinkedIn": "linkedin.com/mweston",
    "PhoneNumber": "123-456-7890",
    "Photo": "//cdn2.content.compendiumblog.com/uploads/user/758c2424-6055-4d3e-880c-4021718d814e/a2b4cd6c-2af2-4f42-b43d-57dbbb04ef02/Image/157e2aa484b667ddc65b75549ce3998f/bring_me_another_smurf_ow8mga4o.jpg",
    "JobTitle": "Spy",
    "Department": "Top Secret",
    "Bio": "<p>\n\tI Could tell you...</p>\n",
    "SAMLUser": false
  }
}
```

<h3 id="workflow">Workflows:</h3>

```ruby

session.workflow.list(options = {})
session.workflow.get(id)
session.workflow.add(workflow_name, options = {}) - ex: options = { required_all: false, required_categories: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'], required_content_types: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'], required_languages: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'], required_publishers: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'], required_users: ['xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'] }
session.workflow.edit(id, options = {})
```

```ruby
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Alert",
    "active": true,
    "priority": 10,
    "required_all": false,
    "required_users": [

    ],
    "required_publishers": [

    ],
    "required_categories": [

    ],
    "required_content_types": [
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Landing Page"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Video Embed"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Image Post"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "When Words Are More Than Enough"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "File Uploader"
      },
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "Text Post"
      }
    ],
    "required_languages": [

    ],
    "business_unit": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Default",
    "active": true,
    "priority": 8,
    "required_all": true,
    "required_users": [

    ],
    "required_publishers": [

    ],
    "required_categories": [

    ],
    "required_content_types": [

    ],
    "required_languages": [

    ],
    "business_unit": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
...
]
```

<h3 id="workflow-stage">Workflow Stages:</h3>

```ruby

session.stage.list(options = {})
session.stage.add(stage_name, options = {}) - ex: options = { color: '00FF00' }
session.stage.edit(stage_id, options = {})
session.stage.delete(stage_id, options = {})
```

```ruby
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Light Bulb",
    "color": "f3f315",
    "stage_order": 0,
    "active": true,
    "stage_type": "planned"
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Drafty",
    "color": "666666",
    "stage_order": 1,
    "active": true,
    "stage_type": "start"
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Do Work",
    "color": "cd00ff",
    "stage_order": 2,
    "active": true,
    "stage_type": "prepublication"
  },
...
]
```

<h3 id="workflow-task">Workflow Tasks:</h3>

```ruby

session.task.list(workflow_id, options = {})
session.task.add(workflow_id, task_name, stage_id, options = {}) - ex: options = { edit_policy: 'once', task_type: 'approve', assignees: [{ assignee_type: 'author' }] }
session.task.edit(workflow_id, task_id, options = {})
session.task.delete(workflow_id, task_id, options = {})
```

```ruby
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "workflow_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "description": "Upload File",
    "edit_policy": "once",
    "task_order": 0,
    "task_type": "todo",
    "deadline_period": -1,
    "note": "",
    "stage": {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Do Work",
      "color": "cd00ff"
    },
    "assignees": [
      {
        "assignee_type": "author"
      }
    ],
    "validation_rules": [

    ]
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "workflow_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "description": "Add Description",
    "edit_policy": "once",
    "task_order": 1,
    "task_type": "todo",
    "deadline_period": -1,
    "note": "Should not be more than 200 words.",
    "stage": {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "Do Work",
      "color": "cd00ff"
    },
    "assignees": [
      {
        "assignee_type": "author"
      }
    ],
    "validation_rules": [

    ]
  },
...
]
```

<h3 id="top_level">Compendium Top Level Methods</h3>

```ruby
session.get(path,query = {})
session.post(path,body,query = {})
session.put(path,body,query = {})
session.delete(path,body = {},query = {})
```


<h3>Helpers:</h3>

```ruby

session.helper.slugify(title)
session.helper.user_id
session.helper.first_live_post
session.helper.network_id
session.helper.pub_ids
```

<h3 id="env">Environment Variables:</h3>

```ruby

Debug Mode: HTTPARTY_DEBUG=true
Proxy: http_proxy=https://proxyserv.com:80
Timeout Mode: HTTPARTY_TIMEOUT=5
```


<h2 id="extend">Extend Class:</h2>

```ruby

module Nretnil
  module CompendiumAPI
    # Compendium Class
    class Compendium
      def some_endpoint
        SomeEndpiontAPI.new(self)
      end
    end

    # SomeEndpointAPI Class
    class SomeEndpointAPI
      def initialize(s)
        @session = s
      end

      def get(parameter)
        query = { parameter: parameter }
        @session.get( '/api/endpoint', query )
      end

      def required_params
        @auth
      end
    end
  end
end

session.some_endpoint.get(parameter)
```
