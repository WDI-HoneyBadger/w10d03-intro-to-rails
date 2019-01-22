# Intro to Rails

## Learning Objectives

- Explain how Ruby on Rails implements MVC
- Diagram & annotate the lifecycle of an HTTP request in Ruby on Rails
- List the most common folders in a Rails application and describe their purpose
- Explain how Convention over Configuration relates to Ruby on Rails
- Introduce ActiveRecord
- Preform some basic model quieries

## MVC Recap

MVC is all about separating your code into separate sections...

* **Models**: allow us to interact with data
* **Views**: describe how to present your data in a way that the user can see in the browser
* **Controllers**: are responsible for responding to user requests, interacting with models and loading views

## Rails and MVC 

Rails adds one additional component it adds to MVC:
a router. A router connects incoming requests on the server to the application's controller. In express, we added our routes within our controllers, but for rails, it becomes its own entity. Thus we sometimes say that Rails is built around **rMVC** - a router, models,
views and controllers. 

[rMVC Diagram](http://i.stack.imgur.com/Sf2OQ.png)

As a result, the request-response cycle looks like this for Rails...

  1. A user of our web application submits a request to our application's server. It could come from a lot of different ways: someone typing in a URL and hitting
  enter, clicking a link, or submitting a form on our application.

  2. The request hits the router of the application.

  3. The application then either doesn't recognize the route (error) or it does
  recognize it (route) and sends it to the appropriate controller.

  4. Once the controller gets the request, it performs any necessary actions. This
  might include fetching, updating, deleting, or creating information using one
  or more models.

  5. Once the controller has performed any actions / retrieved any information
  from the model(s), it uses a view to *render* an HTML page.

  6. The rendered view is then sent back to the client as a response.


## Rails Apps

### Convention Over Configuration in Rails

We've used the phrase "convention over configuration" when describing how to write things in Express.

**Some examples being:**
  * Pluralized table names (e.g., `authors`)
  * Singular, capitalized model names (e.g., `Author`)
  * Singular, lowercase model file names (e.g., `author.rb`)

How does this apply to Rails? Well, Rails is a powerful, full-featured web framework that follows
relatively strict conventions in order to streamline our web development
process.

> It is designed to make programming web applications easier by making
assumptions about what every developer needs to get started. It makes the
assumption that there is a "best" way to do things, and it's designed to
encourage that way - and in some cases to discourage alternatives. -- [Ruby on
Rails guide](http://guides.rubyonrails.org/)

In short, Rails is a framework with lots of rules/conventions. Do things the "Rails" way, and making a server will be extreamly easy. Not doing things the "Rails" way can be difficult and frustrating. Pay attention to the
conventions you'll need to follow for Rails throughout the week.

## Rails Walkthrough

Let's walk through a Rails App to get comfortable with its file structure and
identify where we will be configuring all of the concepts we discussed
above.

Today, we'll be taking a look at a book app I made (in this directory)

### LAB: Time for a Scavenger Hunt 

We'll talk about what all these files and folders mean in just a moment, but first, I want to give you a chance to explore.

Your job is to look through the application and find the Rails equivalents for the following, making sure to focus your search on the `app`, `db` and `config` directories...

* A Database Schema
* Routes
* A `User` model
* Code that should be run when we visit the index page for authors
* The view that should be displayed when we visit the index page for books
* Directories for CSS and Javascript files
* Database configuration settings
* Seeds file.
* App dependencies

<details>
  <summary><strong>Answers...</strong></summary>


  * A Database Schema - `db/schema.rb`
  * Routes - `config/routes.rb`
  * A `User` Model - `app/models/user.rb`
  * Author Index Code - `app/controllers/authors_controller.rb`
  * Book Index View - `app/views/books/index.html.erb`
  * CSS/JS Directories - `app/assets`
  * Database configuration settings - `config/database.yml`
  * Seeds file - `db/seeds.rb`
  * App dependencies - `Gemfile`

</details>

### What Do These Files Mean?

While all these files may be daunting at first, you're already familiar with many of these components from your work with Express. Additionally, rails helps us by generating a lot of the code for us.

The first folder we'll talk about is the `app` folder. This folder is the the most important folder in your entire application. It will contain
most of the programs functionality.

- **`assets`**: this will be where all of your CSS, JS, and image files belong.
- **`controllers`**: this folder will contain all controllers.
- **`models`**: this folder will contain our models.
- **`views`**: this folder contains all of the views in this application.

The `config` is another folder that's pretty important. The file you'll most be
visiting is `routes.rb` — this is where we define routes for our file.

The `db` folder is one you'll be working in for a bit of time as well. This
contains the schema and seed files. Additionally, it will also contain your migrations which are how we configure our tables.

In the root directory of the application you will also see a `Gemfile` and, if you've run `bundle install`, `Gemfile.lock`

### LAB: Rails Commands

The following are commands that we may run when creating and updating a Rails application. Your task is to reseach these and figure out what they're doing. You answers don't need to be technical - keep it basic.

| Command | What does it do? |
|---------|------------------|
| `bundle install` | |
| `rails db:drop` | |
| `rails db:create` | |
| `rails db:migrate` | |
| `rails db:seed` | |
| `rails s` | |
| `rails new book_app --api -G --database=postgresql`| |
| `rails c` | |

> The `rails` command took the place of `rake` in Rails 5.0.0. However, you will still see examples that use `rake`.


<details>
  <summary><strong>Answers...</strong></summary>

  * `bundle install` - Loads and sets up the local dependencies
  * `rails db:drop` - Drops the database, if it exists
  * `rails db:create` - Creates the database, equivalent to `createdb db_name`
  * `rails db:migrate` - Sets up schema, equivalent to `psql -d db_name < schema_file.sql`. Creates the tables in the database
  * `rails db:seed` - Runs seed file. Populates the tables.
  * `rails s` - Starts the server
  * `rails new book_app -G --api --database=postgresql` - creates a new rails app, without git (`-G`), as an api - without certain parts of rails for rendering views (`--api`), with using a postgresql database (`--database=postgresql`)
  * `rails c` - opens a console to work within our rails environment

</details>

------

Lets start up our app. Inside of the book_app directory run:
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`
- `rails s`

We should see something like this in the Terminal...

```bash
=> Booting Puma
=> Rails 5.2.2 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.0 (ruby 2.6.0-p0), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
```

`http://localhost:3000` is where we can begin interacting with our Rails application in the browser.

> `3000` is the default port number in a Rails Application.


## Creating your own Rails app!

Now lets create our very first rails app. In your terminal, run:
-  `rails new my_first_rails_app -G --database=postgresql`
- `cd my_first_rails_app` 
- `code .`

Your file tree should look something like this:
```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── assets
│   │   ├── config
│   │   │   └── manifest.js
│   │   ├── images
│   │   ├── javascripts
│   │   │   ├── application.js
│   │   │   ├── cable.js
│   │   │   └── channels
│   │   └── stylesheets
│   │       └── application.css
│   ├── channels
│   │   └── application_cable
│   │       ├── channel.rb
│   │       └── connection.rb
│   ├── controllers
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── helpers
│   │   └── application_helper.rb
│   ├── jobs
│   │   └── application_job.rb
│   ├── mailers
│   │   └── application_mailer.rb
│   ├── models
│   │   ├── application_record.rb
│   │   └── concerns
│   └── views
│       └── layouts
│           ├── application.html.erb
│           ├── mailer.html.erb
│           └── mailer.text.erb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   ├── spring
│   ├── update
│   └── yarn
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── credentials.yml.enc
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── application_controller_renderer.rb
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── content_security_policy.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── master.key
│   ├── puma.rb
│   ├── routes.rb
│   ├── spring.rb
│   └── storage.yml
├── config.ru
├── db
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
├── package.json
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── apple-touch-icon-precomposed.png
│   ├── apple-touch-icon.png
│   ├── favicon.ico
│   └── robots.txt
├── storage
├── test
│   ├── application_system_test_case.rb
│   ├── controllers
│   ├── fixtures
│   │   └── files
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   ├── system
│   └── test_helper.rb
├── tmp
│   ├── cache
│   │   └── assets
│   └── storage
└── vendor
```

As you can see, rails generates a lot of our files for us. Fortunately, for the apps we do in this class, we'll only need to edit a few of these files.

### Setting up our Models

For the rest of today, we will be talking about the **M** part of **M**VC. In rails, our data management will be done through an `ORM` called `ActiveRecord`.

**What is an ORM?**

An ORM or a Object-relational mapping (tool) is a programming technique for converting data between incompatible type systems using object-oriented programming languages. This creates, in effect, a "virtual object database". In short, it is a tool that allows us to use Ruby to talk to our databse. Rails by default comes with `ActiveRecord`.

### Creating a model

Rails has a handy command for us to create a model:
> `rails g model pet`

This will create 2 files for us:
- `/db/migrate/20170716204001_create_pets.rb` (or something similar - the number at the beginning will be different)
- `/app/models/pet.rb`

### Migrations
Our migrations are where we are going to define what our tables will look like. Through migrations, we'll be able to change up our column names, the datatypes that our table will accept in each column, and we'll be able to add, delete, and rename columns on the fly.

Think of your migrations as a step-by-step guide to making your final database structure. You should be creating a new migration every time you need to change the structure of your tables.

For now, lets just create a table for our pets. Open up your `create_pets` migration file. It should look something like this:

```ruby
class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|

      t.timestamps
    end
  end
end
```

We are going to add a few columns to our table:
```ruby
class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name,
      t.string :species,
      t.string :owner,
      t.timestamps
    end
  end
end
```

Save your file and now run:
- `rails db:create`
- `rails db:migrate`

Congratulations! You just created your first table! We will go over more you can do with migrations tomorrow. For now, lets take a look at how we can interact with the table we just created.

Look at your pet model in `/app/models/pet.rb`. It should look like this:

```ruby
class Pet < ApplicationRecord
end
```

Not very long, but still very powerful. This class is our model, representing our pets table, and will allow us to make all types of queries to it. 

Open your rails console: `rails c`. Here we can interact with our model and preform different queries.

## Additional Resources
- [Rails Documentation](http://api.rubyonrails.org/)
- [Rails Github](https://github.com/rails/rails)