## README

* update application_helper
* update ENV variables: `FB_PAGE`, `FB_APP_ID`, `FB_SECRET`

* update `database.yml`
* set `config.action_mailer.default_url_options` in `production.rb`
* add `GOOGLE_ANALYTICS` env variable or edit the `_ga.html.erb`

![alt tag](http://cdn.meme.am/instances/48077677.jpg)

## Use AWS for paperclip uploads like that:
```
app_namespace = 'skeleton_app' # one bucket - multiple apps - split into folders by its namespace
has_attached_file :image, :styles => { normal: "600x600#", small: "341x333#", thumb: "75x75#"},
  :default_url => "/avatar/:style.png",
  :storage => :s3,
  :s3_credentials => {
    :bucket => 'granat-contests',
    :access_key_id => '#{ENV[S3_KEY]}',
    :secret_access_key => '#{ENV[S3_ACCESS]}'
  },
  :path => app_namespace + if Rails.env.production? then "/:id/:style.:extension" else "/dev/:id/:style.:extension" end
validates :image, presence: true
```

## Need voting?

uncomment `gem 'acts_as_votable', '~> 0.10.0'` in `gemfile`

```
rails generate acts_as_votable:migration
rake db:migrate
```
then more info here: [ryanto/acts_as_votable](https://github.com/ryanto/acts_as_votable)
