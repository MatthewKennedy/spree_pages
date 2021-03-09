# Get Action Text Working In Spree

Setting up AxtionText and TRIX to work with spree requires a few extra steps:

1. First, be sure you have ActionText ready in your rails app by running the installs: `rails action_text:install` and `rails active_storage:install`, and all the migrations have been run.

2. In: `vendor/assets/stylesheets/spree/backend/all.css` & `vendor/assets/stylesheets/spree/frontend/all.css` add the line `//= require actiontext`
at the very top of the style sheets, it should look somthing like this:

```css
//= require actiontext

/*
 * This is a manifest file that'll automatically include all the stylesheets available in this directory
 * and any sub-directories. You're free to add application-wide styles to this file and they'll appear at
 * the top of the compiled file, but it's generally better to create a new file per style scope.
 *
 *= require spree/frontend

 *= require_self
 *= require_tree .
 *= require spree/frontend/spree_pages
*/

```


3. In: `app/javascript/packs/application.js` remove `Rails.start()` & `import Rails from "@rails/ujs"` (Spree already adds Rails UJS).
It shoudl look somehthing like this:

```javascript
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

```


4. In `views/spree/layouts` add `admin.html.erb`, paste the HTML from the Spree backend `admin.html.erb` and add in the`<%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>` within the `<head>`,
  (this pulls in the javascript required for TRIX editor).

5. In the same file add: `data-turbolinks="false"` to the `<html>` tag to disable turbolinks in the admin UI. The file shoudl look soething like this:

```html
<!DOCTYPE html>
<html lang="<%= I18n.locale %>" data-turbolinks="false">
  <head data-hook="admin_inside_head">
    <%= render partial: 'spree/admin/shared/head' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body class="admin">
..........
```


6. In: `config/application.rb` add the following code:

```ruby
module YourApp
  class Application < Rails::Application



    # Configs for action_text in Spree.
    config.action_view.sanitized_allowed_tags = ["strong", "em", "b", "i", "p", "pre", "hr", "br", "div", "span",
      "h1", "h2", "h3", "h4", "h5", "h6", "ul", "ol", "li", "a", "img",
      "blockquote"]

    config.action_view.sanitized_allowed_attributes = ["href", "src", "width", "height",
      "alt", "title", "class", "id", "name"]
  end
end
```

I think that is all.
