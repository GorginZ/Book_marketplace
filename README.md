# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:



| R1   | Create your *app* using Ruby on **Rails**.                   |
| ---- | ------------------------------------------------------------ |
| R2   | Use **Postgresql** database in development and production.   |
| R3   | Your *app* will have authentication (eg. Devise).            |
| R4   | Your *app* will have authorisation (i.e. users have restrictions on what they can see and edit). |
| R5   | Your *app* will have some type of file (eg. images) uploading capability. |
| R6   | Your *app* is to be deployed to Heroku (recommended) or AWS. |

R3. My app uses the devise Gem for authentication. 



**R4. Authorization**

I used cancancan for authorisation. An example of how this helped me create different restrictions for users with regard to what they can see and edit etc. is the restrictred access to *Category* methods. Only Admin users can use C R U D methods on Categories. This is because the categories that exist are what users will select from when they create a listing when they declare the category of their listing, so it's important they are not duplicated. The category primary key is the foreign key for the listing, allowing  The Category model exists mostly to ensure with easy browsing, and so if Admins are able to edit and add categories accordingly, to do with popularity or to accomidate for certain types of listings, this is a good way to make that easy to manage. 
With regards to moderation, it also means that admins can remove or edit anything inappropriate or correct errors.

 https://github.com/CanCanCommunity/cancancan/wiki/Authorizing-controller-actions

* 
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
