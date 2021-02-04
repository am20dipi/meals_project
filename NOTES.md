1. ORM 
2. Schema
3. Migrations; relationship of tables to classes, rows to instances
4. Memoization
5. double bang operator
6. What is logging in? What is logging out?
7. What is signing up?
8. Describe sessions
9. ERB files - embedded ruby
10. ActiveRecord Inheritance
11. ActiveRecord Associations
12. ActiveRecord Validations
13. Render v. Redirect
14. RESTful Routes
15. builder methods
16. RackMethod::Override
17. name="" attribute and its relationship to params
18. Form tag structure
19. Role of Instance Variables in controllers & views
20. STATELESS



HTTP VERB   Route              Action

GET        /meals              index
GET        /meals/:id          show
POST       /meals              create
GET        /meals/new          new
GET        /meals/:id/edit     edit
PATCH      /meals/:id          update
DELETE     /meals/:id          destroy

Browser makes a HTTP(get, post, patch...) request to a specific route.
Sinatra receives the request and routes it to the appropriate action in the controller.
The controller asks the model for the data.
The model queries the database using ActiveRecord.
The model passes data back to controller.
The controller sends the data to the view.
The view renders and parses HTML.
The view sends it back to the controller.
The controller sends HTML to the browser to view.