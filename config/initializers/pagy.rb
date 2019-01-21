# Pagy initializer file
# Bulma extra: Add nav, responsive and compact helpers and templates for Bulma pagination
# See https://ddnexus.github.io/pagy/extras/bulma
require 'pagy/extras/bulma'

# Items extra: Allow the client to request a custom number of items per page with an optional selector UI
# See https://ddnexus.github.io/pagy/extras/items
require 'pagy/extras/items'
Pagy::VARS[:items_param] = :items    # default
Pagy::VARS[:max_items]   = 100       # default

# Trim extra: Remove the page=1 param from links
# See https://ddnexus.github.io/pagy/extras/trim
require 'pagy/extras/trim'

# Instance variables
# See https://ddnexus.github.io/pagy/api/pagy#instance-variables
Pagy::VARS[:items] = 2


# Other Variables
# See https://ddnexus.github.io/pagy/api/pagy#other-variables
# Pagy::VARS[:size]       = [1,4,4,1]                       # default
# Pagy::VARS[:page_param] = :page                           # default
# Pagy::VARS[:params]     = {}                              # default
# Pagy::VARS[:anchor]     = '#anchor'                       # example
# Pagy::VARS[:link_extra] = 'data-remote="true"'            # example
# Pagy::VARS[:item_path]  = 'activerecord.models.product'   # example


# Rails
# Rails: extras assets path required by the compact and responsive navs, and the items extra
# See https://ddnexus.github.io/pagy/extras#javascript
# Rails.application.config.assets.paths << Pagy.root.join('javascripts')

# I18n faster internal pagy implementation (does not use the I18n gem)
# Use only for single language apps that don't need dynamic translation between multiple languages
# See https://ddnexus.github.io/pagy/api/frontend#i18n
# Notice: Do not use any of the following lines if you use the i18n extra below
# Pagy::Frontend::I18N.load(file: Pagy.root.join('locale', 'es.yml'), language:'es') # load 'es' pagy language file
# Pagy::Frontend::I18N.load(file:'path/to/dictionary.yml', language:'en')            # load a custom 'en' file
# Pagy::Frontend::I18N[:plural] = -> (count) {(['zero', 'one'][count] || 'other')}   # default
