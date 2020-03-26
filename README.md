# Semantic MediaWiki

Create and start a Docker image that contains a _vanilla_ [Semantic MediaWiki][1]


## Step 1: Get MediaWiki up and running

The intent is to run through the initial MediaWiki setup, have MediaWiki generate a 
`LocalSettgins.php`, and end up with a working plain MediaWiki:

* Trigger inital build and start the image: 

  ```
  :> docker-compose up -d
  ```

* Setup MediaWiki via its web based GUI at http://localhost:8081

  _Note:_ make sure to select **SQLite** as the database type!

* Download and save the `LocalSettings.php` into this folder

* Stop the running container

  ```
  :> docker-compose stop
  ```

* Open the `docker-compose.yaml`, uncomment the line mounting the `LocalSettings.php`, save the file

* Test the wiki (now with the setup stored in `LocalSettings.php`)

  ```
  :> docker-compose up -d
  ```


## Step 2: Activate Semantic MediaWiki

This section follows the install guideline of [Semantic MediaWiki][1] at their [guide][2].

* Append `enableSemantics()` to the end of `LocalSettings.php`

  ```
  :> echo "enableSemantics();" >> LocalSettings.php
  ```
  _Note:_ as this is a proof-of-concept, the host parameter to `enableSemantics()` is empty. (According
  to [3] this shouldn't be a problem.) 
  
* Run `update.php`
 
  ```
  :> docker-compose run smw php maintenance/update.php
  ```
  
* Start the configured Semantic MediaWiki

  ```
  :> docker-compose up -d
  ```

* Test your vanilla SMW  at http://localhost:8081
    

[1]: https://www.semantic-mediawiki.org
[2]: https://www.semantic-mediawiki.org/wiki/Help:Installation/Quick_guide
[3]: https://www.semantic-mediawiki.org/w/index.php?title=Help:EnableSemantics
