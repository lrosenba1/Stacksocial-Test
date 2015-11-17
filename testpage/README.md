# Stacksocial-Test

# Description
This is a Ruby on Rails application that uses a postgresql database.  This app interfaces with the Twitter Api using OAuth authentication to present a timeline of the last 25 tweets of any Twitter handle.

# Design
This app uses Rails 4.1.6 and Ruby 2.1.2p95
It has a basic login/signup interface which uses the bcrypt gem for password security.
The omniauth-twitter gem is used for Twitter OAuth authentication.
The twitter gem is used for getting the tweets.
A rails library method makes the call to the Twitter Api and the resulting tweets are displayed by the view.

# Local Environment Setup Instructions (using command-line)
## Application Environment
* Make sure Ruby is installed.  You can install it with RVM: go to https://rvm.io/rvm/install
* If not already installed, install Postgresql
  * If using homebrew: `brew install postgresql`
* To start database, run

  ```
  mkdir -p ~/Library/LaunchAgents
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  ```
* cd to the directory you want the application in
* run `git clone https://github.com/lrosenba1/Stacksocial-Test.git`
* run `bundle install`

## Twitter configs
* create a twitter account
* go to https://dev.twitter.com/ and click Manage Your Apps under Tools at the bottom of the page
* click Create New App and create an app
* put http://127.0.0.1:3000/auth/twitter/callback in the Callback URL section
* after your application is created get the *Consumer Key* and *Consumer Secret*
* in a terminal save them as environment variables ( best way is to export them in a bash file):

  ```
  #!/bin/bash
  export twitter_api_key="Your consumer key"
  export twitter_api_secret="Your consumer secret"
  ```
  * then run . ./yourfilename.bash

## To Run the Application
* If not already, cd into the top directory of the rails application (testpage folder)
* run `rails server`
* Open browser and go to localhost:3000/auth/twitter
* Say yes to authenticate application to use twitter
* Have fun with the application!


# Deploy to Heroku
* Create a Heroku account
* follow steps on https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up to download the Heroku Toolbelt
* run `heroku create yourappname` to create an app on Heroku so Heroku can receive your source code
* create heroku environment variables for twitter api authentication:

  `heroku config:set twitter_api_key=yourconsumerkey twitter_api_secret=yourconsumersecret`
* before pushing code to heroku add bash file .gitignore file
* run `git subtree push --prefix testpage heroku master` to deploy to heroku
* After that runs it will say https://yourapp.herokuapp.com/ deployed to Heroku
* open browser and go to the link
* Have fun with the application!

# To Do List (Future Enhancements)
* consider adding bootstrap UI presentation
* possibly add other twitter features such as tweeting
* consider enhancing to a Single Page Application(SPA)
* Fortify application authentication by adding email verification and/or mobile sms verification
