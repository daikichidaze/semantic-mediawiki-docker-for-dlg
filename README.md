# Semantic MediaWiki Docker file for DLG
DLG: [Data learning guild](https://data-learning.com/guild)

1. cloned from https://gitlab.com/hcc23/semantic-mediawiki-docker
1. Add Mediawiki extentions
  * Import Itembox template[1] from Wikipedia (following [the oficial process](https://www.mediawiki.org/wiki/Manual:Importing_Wikipedia_infoboxes_tutorial))
  * Install UserMerge[2] extention

---
Copyed from https://gitlab.com/hcc23/semantic-mediawiki-docker

# Semantic MediaWiki

Create and start a Docker image that contains a _vanilla_ [Semantic MediaWiki][3]


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

* Stop the running setup container and remove it

  ```
  :> docker-compose down
  ```

* Open the `docker-compose.yaml`, uncomment the line mounting the `LocalSettings.php`, save the file

* Test the wiki (now with the setup stored in `LocalSettings.php`)

  ```
  :> docker-compose up -d
  ```


## Step 2: Activate Semantic MediaWiki

This section follows the install guideline of [Semantic MediaWiki][3] at their [guide][4].

* Stop the running container

  ```
  :> docker-compose stop
  ```

* Append `enableSemantics()` to the end of `LocalSettings.php`

  ```
  :> echo "enableSemantics();" >> LocalSettings.php
  ```
  _Note:_ as this is a proof-of-concept, the host parameter to `enableSemantics()` is empty. (According
  to [5] this shouldn't be a problem.) 
  
* Start the configured Semantic MediaWiki

  ```
  :> docker-compose start
  ```

* Run `update.php`
 
  ```
  :> docker-compose exec smw php maintenance/update.php
  ```  

* Test your vanilla SMW  at http://localhost:8081

[1]: https://en.wikipedia.org/wiki/Template:Infobox
[2]: https://www.mediawiki.org/wiki/Extension:UserMerge
[3]: https://www.semantic-mediawiki.org
[4]: https://www.semantic-mediawiki.org/wiki/Help:Installation/Quick_guide
[5]: https://www.semantic-mediawiki.org/w/index.php?title=Help:EnableSemantics
