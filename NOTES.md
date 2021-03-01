1. ORM X
2. Schema X
3. Migrations; relationship of tables to classes, rows to instances X
4. Memoization X
5. double bang operator X
6. What is logging in? What is logging out? X
7. What is signing up? X
8. Describe sessions
9. ERB files - embedded ruby X
10. ActiveRecord Inheritance
11. ActiveRecord Associations
12. ActiveRecord Validations
13. Render v. Redirect X
14. RESTful Routes X 
15. builder methods
16. RackMethod::Override X
17. name="" attribute and its relationship to params
18. Form tag structure
19. Role of Instance Variables in controllers & views X
20. STATELESS
21. helper methods X
22. Bcrypt, has_secure_password X



HTTP VERB   Route              Action

GET        /meals              index
GET        /meals/:id          show
POST       /meals              create
GET        /meals/new          new
GET        /meals/:id/edit     edit
PATCH      /meals/:id          update
DELETE     /meals/:id          destroy


FLOW

Browser makes a HTTP(get, post, patch...) request to a specific route.
Sinatra receives the request and routes it to the appropriate action in the controller.
The controller asks the model for the data.
The model queries the database using ActiveRecord.
The model passes data back to controller.
The controller sends the data to the view.
The view renders and parses HTML.
The view sends it back to the controller.
The controller sends HTML to the browser to view.




helper methods: 
1. current_user
    # ||= "or equals" 
    # Memoization: there may be multiple calls to current_user
    # Is there a current_user ? give it to me. If not, hand one in. 
    # If @user is undefined then define it as a whatever follows the ||= sign. 
    # We store the result of User.find_by to the instance variable @user.
2. logged_in?
    # the double bang operator !! returns true or false
    # we are asking if someone is logged in via is there a user id stored in the session's hash?



RackMethod::Override
    - Rack is middleware that lets our application send PATCH requests. 
    - Rack looks through all requests made and looks to see if any of them have an attribute "name=_method"
    - if there is one instance of that, Rack overrides the post(or http verb) request and makes it a patch request; by making the value attribute equal to "patch" (value="patch")


Logging in :
    1. user logins via FORM
    2. user submits the FORM - which POSTS the data to the controller route
    3. the controller route accesses the user's email & password from the PARAMS HASH
    4. the user's id is stored as the value of session[:user_id]
    5. we grab the current user by matching the user id with the value of session[:user_id]

Logging out : 
    1. user clicks log out
    2. the controller route '/logout' clears the session hash
    3. the user's id is no longer stored in the sessions hash as the value of session[:user_id]

Signing up : 
    1. user signs up via FORM
    2. user submits the FORM - which POSTs the data to the controller route
    3. the instance of the user is saved in the params via user ID



The Role of Instance Variables
    -  the use of instance variables in a controller route is to expose whatever is stored 
    in said instance variable to the view. 
    - @foods = current_user.foods.all => this is querying the DB for all foods and loading the
    foods into an instance variable. 

Render: tells Sinatra which view to show a user
Redirect: tells your browser to send a request to another URL


RESTful Routes
- provides a standard; convention
- makes web applications scalable
- makes it ease of use for everyone
- RESTFUL ROUTES ACHIEVE CRUD ACTIONS!!!!!!!!!



ORM (Object Relational Mapping):
    - makes its possible to address, access and manipulate objects
    - tables to objects, rows to instances
    - connects objects of an application to tables in a relational database

Schema
    - defines tables and columns without using SQL directly
    - can support multiple tables
    - provides a blueprint about how the database data is structured

ERB
    - embedded ruby
    - allows you to use ruby while in an HTML file



Use vs Run
    - in our config.ru, we mount(use) certain controllers that inherit from our ApplicationController.
    - we run our ApplicationController. 

Config.ru
    - sets up our environment
    - mounts & runs our controllers
    - it is our executable file - what runs the app
    - .ru = "rackup" it is a rack configuration file
    - offers a standard protocol for web servers to execute applications and programs
    - Rack is a DSL


BCRYPT (a gem)
- stores a hashed version of user's passwords in the DB in a column called "password_digest"
- works in conjunction with the macro "has_secure_password": stores password without displaying it as plain text

Has_secure_password (a macro)
- works in conjunction with BCrypt
- a macro given to us via ActiveRecord
- provides us a set of methods (.authenticate => checks to see if the value of password_digest is equal to the user's password, thus authenticating the user)


AR Associations
- your models inherit from ActiveRecord which gives them access to methods & macros. 
- has_many & belongs_to are macros: they create a link between two or more models


