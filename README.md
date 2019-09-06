# Hangman
classic hangman game in cli and web

Makes use of sessions to serve the game to multiple hosts at the same time.

See live: https://quiet-hamlet-10480.herokuapp.com/

To run the web based version on local machine, clone this repo and install the dependencies with bundler before running
```
bundle install
ruby hangman_web.rb
```

Assets (Words list, Stick Art, Game) are defined in respective ruby classes. To play on command line
```
ruby hangman_cli.rb
```
