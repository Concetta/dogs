# README

An application that pulls dog videos from the YouTube Api, in which you can like and comment on videos. Information is not posted back to the YouTube video. 
A User needs to be signed in to like or comment. 
 
 ````
 $ ruby --version
 ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
````

````
$ rails --version 
Rails 5.1.6
````

You will need to add the client_secrets.json file to your project to obtain YouTube videos. 

The application is deployed on Heroku

In order to obtain YouTube videos: 

````
$ ruby app/services/youtube_search.rb
$ rake db:seed
````

Future features: 

* Handeling duplicate videos, and videos with errors
* Users are able to pull videos 
* Dashboard for Users to view their most liked videos etc
* Comment page needs styling & JS components so that page does not need to reload
* Bootstraps hover styling needs to be removed
* If User is not signed in and clicks like - the user should be redirected to that action after sign up

Repositories 
private: git@bitbucket.org:ConcettaBug/dogs.git
public: git@github.com:Concetta/dogs.git
