#!/bin/sh

# To make sure that relative paths work
cd ~/projects/website

# Goal: Keep longer content that we want to keep separate from version control in text files.
about="$(cat configs/content/about.txt)"

cat << EOF

baseurl = "/"
languageCode = "en-us"
title = "Thomas Loeber"
theme = "hugo-future-imperfect"
preserveTaxonomyNames = true
paginate = 3
disqusShortname = "shortname"
googleAnalytics = ""
pluralizeListTitles = false
# Set the followings to true as part of your site SEO
enableRobotsTXT = true
canonifyURLs = true

[params]
  # Sets the meta tag description
  description          = "Thomas Loeber's personal website"
  # Sets the navbarTitle that appears in the top left of the navigation bar
  navbarTitle          = "Thomas Loeber"
  # Sets where "View More Posts" links
  viewMorePostLink     = "/blog/"

# Optional Params
  # Sets navbarTitle to match the section of the website
  dynamicTitles        = true
  # Sets RSS icons to appear on the sidebar with the social media buttons
  rssAppearAtTop       = false
  rssAppearAtBottom    = false
  # Sets Social Media icons to appear on the sidebar
  socialAppearAtTop    = true
  socialAppearAtBottom = true
  # Sets Categories to sort by number of posts instead of alphabetical
  categoriesByCount    = true
  # set to show or to hide categories in the sidebar
  showSidebarCategories = true
  # Sets Estimated Reading Time to appear in post headers
  includeReadingTime   = true
  # Sets the Favicon and Version for the site. Default support is for
  # apple-touch-icon-precomposed.png, favicon.png, favicon.ico, and mstile.png.
  # These are stored in the favicon folder. See the following for more information:
  # https://github.com/audreyr/favicon-cheat-sheet
  loadFavicon          = false
  faviconVersion       = ""
  # Sets Social Share links to appear on posts
  socialShare          = true
  # Sets specific share to appear on posts (default behavior is to appear)
  socialShareTwitter   = true
  socialShareGoogleplus = true
  socialShareFacebook  = true
  socialShareReddit    = true
  socialShareLinkedin  = true
  socialShareStumbleupon = true
  socialSharePinterest = true
  socialShareEmail     = true

  # Load custom CSS or JavaScript files. The variable is an array so that you
  # can load multiple files if necessary. You can also load the standard theme
  # files by adding the value, "default".
  # customCSS            = ["default", "/path/to/file"]
  # customJS             = ["default", "/path/to/file"]
  customCSS            = ["default"]
  customJS             = ["default"]

  # options for highlight.js (version, additional languages, and theme)
  disable_highlight = false # set to true to disable Highlight
  highlightjsVersion = "9.11.0"
  highlightjsCDN = "//cdn.bootcss.com"
  highlightjsLang = ["r", "yaml", "css"]
  highlightjsTheme = "github"
  MathJaxCDN = "//cdn.bootcss.com"
  MathJaxVersion = "2.7.1"

# Disqus will take priority over Staticman (github.com/eduardoboucas/staticman)
# due to its ease of use. Feel free to check out both and decide what you would
# prefer to use. See Staticman.yml for additional settings.
[params.staticman]
  # Sets Statiman to be active
  staticman = false
  # Sets the location for Staticman to connect to
  username  = ""
  repo      = ""
  branch    = ""

  [params.staticman.recaptcha]
    sitekey = "SITE_KEY"
    secret  = "ENCRYPTED_SECRET"

  # These are optional params related to the sidebar. They are recommended, but not
  # required for proper functionality. HTML is supported within the params.
[params.intro]
  header    = "Thomas Loeber"

  paragraph = "Welcome to my personal website!"

  about     = "$about"
   
  # This appears at the top of the sidebar above params.intro.header.
  # A width of less than 100px ims recommended from a design perspective.
  [params.intro.pic]
    src       = "/img/Thomas_Loeber.jpg"
    # Sets Image to be a cirlce
    circle    = false
    # Sets Image to be Future Imperfect's hexagon
    imperfect = true
    width     = ""
    alt       = "Hugo Future Imperfect"

[params.postAmount]
# Sets the number of recent posts to show in the sidebar. The default value is 5.
    sidebar = 5

# Sets the menu items in the navigation bar
# Identifier prepends a Font Awesome icon to the menu item
[[menu.main]]
  name = "Home"
  url = "/"
  identifier = "fa fa-home"
  weight = 1

[[menu.main]]
  name = "About"
  url = "/about/"
  identifier = "fa fa-id-card-o"
  weight = 2

[[menu.main]]
  name = "Blog"
  url = "/blog/"
  identifier = "fa fa-newspaper-o"
  weight = 3

[[menu.main]]
  name = "Itemized"
  url = "/itemized/"
  identifier = "fa fa-list"
  weight = 4

[[menu.main]]
  name = "Categories"
  url = "/categories/"
  identifier = "fa fa-sitemap"
  weight = 5

[[menu.main]]
  name = "Contact"
  url = "/contact/"
  identifier = "fa fa-envelope-o"
  weight = 6

# Sets Social Media icons to appear and link to your account. Value should be your
# username unless otherwise noted. These are the icons affected by socialAppearAtTop
# and socialAppearAtBottom.
[social]
  # Coding Communities
  github           = "tloeber"
  # gitlab           = ""
  # stackoverflow    = "" # User Number
  # bitbucket        = ""
  # jsfiddle         = ""
  # codepen          = ""

  # # Visual Art Communities
  # deviantart       = ""
  # flickr           = "example"
  # behance          = ""
  # dribbble         = ""
  # # Publishing Communities
  # wordpress        = ""
  medium           = "thomas.loeber73"
  
  # Professional/Business Oriented Communities
  linkedin         = "thomas-loeber"
  # linkedin_company = "examplebusiness"
  # foursquare       = ""
  # xing             = ""
  # slideshare       = ""
  
  # # Social Networks
  # facebook         = "example"
  # googleplus       = ""
  # reddit           = "example"
  # quora            = ""
  # youtube          = ""
  # vimeo            = ""
  # whatsapp         = "" # WhatsApp Number
  #   # WeChat and QQ need testing.
  #   wechat         = ""
  #   qq             = "" # User ID Number
  # instagram        = "example"
  # tumblr           = ""
  twitter          = "@thomas_loeber"
  # skype            = ""
  # snapchat         = ""
  # pinterest        = "example"
  # telegram         = "example"
  # vine             = ""
  # googlescholar    = ""
  # orcid            = ""
  # researchgate     = "example"
  
  # Email
  email            = "thomas.loeber73+ws@gmail.com"

EOF