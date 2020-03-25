# Semantic MediaWiki

Create and start a Docker image that contains a _vanilla_ [Semantic MediaWiki][1]

* Trigger inital build and start the image

  ```
  :> docker-compose up -d
  ```

* Setup MediaWiki via its web based guid at http://localhost:8081
** make sure to select *SQLite* as the database type!
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

 
Follow the install guideline of [Semantic MediaWiki] at their [guide][2] and

* Append `enableSemantics()` to the end of `LocalSettings.php`

  ```
  :> echo "enableSemantics();" >> LocalSettings.php
  ```
  
* Run `update.php`
 
   ```
   :> docker-compose run smw php maintenance/update.php
   ```
  
* Start the configured Semantic MediaWiki

  ```
  :> docker-compose up -d
  ```

* Start playing around with your vanilla wiki at http://localhost:8081
    
[1]: https://www.semantic-mediawiki.org
[2]: https://www.semantic-mediawiki.org/wiki/Help:Installation/Quick_guide
