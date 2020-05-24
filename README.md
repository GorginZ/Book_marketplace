# README

**Explain the different high-level components (abstractions) in your App**

**Active Record** associations perform a number of critical high level functinos behind the scenes in my application. The declared associations between my active record models allow me to use the methods added to my models by these associations to manipuate objects in my database. One basic example is the dependent: :destroy association, which establishes a relation between one model and another, in my case Listings belongs_to :user.  This declared association means if a user is deleted the other objects in Listings model that are dependent on that user  are destroyed, which helps maintain order in the database and prevent orphaned listings.

Another useful example of how high level active record funcitons help my app run are the methods that come with the has_one_attached association. Listings and Category objects has_one_attached :picture. This association provides me with a scope I can call on those objects when I query the database to grab the pictures in my controller to feed to my views. I can call 

```
    @listings = Listing.where(available: true).with_attached_picture.all.limit(100)

```

in my show, and the with_attached_picture scope that comes along with the has_one_attached association allows me to reduce my database queries, because there is that association declared in my model.

The active record associations that exist between my models mean that when users create or edit listings, for instance if they edit the category of a listing, because of the active record association that exists between Listing and Category, the object is correctly updated in the database by SQL commands that will run when the edit action is executed.

Active recodrd associations are what allow for proper dynamic interaction and smooth operation and updating of my objects in reference and with respect to the appropriate relations and associations that need to exist for funcitnoality. 



A second example **Active Storage**, follows on from Active Record associations, as the scopes and methods discussed above allows me to access Active Storage attachments. I use active storage attachments to allow users to upload images through Amazon S3. Their uploads become associated with the object they are attaching it to and are able to be queried thorugh that association. The attachment is not in the database table like other attributes of a Listing like title, price etc, however. The way it works is this:  Active storage attachments create a polymorphic join table. It uses two tables, active_storage blobs and active_storage_attachments and it is through this association it is able to attach the file to the record. The SQL it spits out is like so: 

```
ActiveStorage::Attachment Load (0.5ms)  SELECT "active_storage_attachments".* FROM "active_storage_attachments" WHERE "active_storage_attachments"."record_type" = $1 AND "active_storage_attachments"."name" = $2 AND "active_storage_attachments"."record_id" IN ($3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19)
```

My config/environments/test.rb is configured such that my active_storage service is amazon as opposed to local, and so when an image is attached Active Storage generates URL for the file using access keys for the S3 bucket associated with my app.







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

R5. 

R6. I deployed my app through heroku initially after creating it. I utilised auto-deploy so my app was built after each push to my master on my github Repo. 

User Stories

as a student I'm generally pressed for cash, and university compulsory text books are expensive. Often students use university social Facebook groups to sell text books and have to meet up on campus at the beginning or end of semester. A web app that creates a forum where users can list and buy from across the country and send and receive texts by post opens this up for wider accessability to second hand texts.
Users:

- I want to be able to brows the app easily to explore the features available before creating an account and signing up
- I want my account to be easily manageable with options to change or update my password and change any key information
- I want to feel confident my information and privacy is being treated appropriately and in accordance with laws around personal information such as handling of credit card details and my contact details and only hand over information that is necessary for my own use of the services ( for example, assurance that my password or card details are handled by a trusted third party group that I can read about if I choose )
- be able to lodge grievances or get help in the instance something doesn't work out for me

When selling:

- I want simple listing forms so I can easily add a listing's title, author and category
- I want to easily manage and view my listings
- I want to be notified if someone has bought my listing
- I want to be able to communicate with buyer
- I want to be able to list pick-up options, incase the buyer is local and that is preferable

When purchasing:

- I want to be able to easily brows for texts and see what is available before making an account
- I want a search function
-  I want to be able to communicate with who I am buying from
- I want a basic level of protection when purchasing, I want to be able to raise an issue with an administrator if I did not recieve an item or have an issue, if I am unable to resolve this with the seller I'd like to know I may be able to make a complaint or have an issue resolved with support.







* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

Detail any third party services that your App will use





Explain the different high-level components (abstractions) in your App