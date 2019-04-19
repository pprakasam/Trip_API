<h1>Trip Planner</h1>
<h6>Trip Planner - a SPA to create trips and organize all trip data.</h6>

<a href="https://github.com/pprakasam/Trip_Client">Click here</a> for front end repo

<a href="https://pprakasam.github.io/Trip_Client/">Click here</a> for deployed client

<a href="https://whispering-tor-85770.herokuapp.com/">Click here</a> for deployed API

<h3>Technologies</h3>
<h6>PostgreSQL, Ruby on Rails</h6>

<h3>ERD</h3>
<img src="http://imgur.com/DWbLMC5">

<h3>Routes</h3>
<h5>Trip Routes:</h5>
<ul>
  <li>GET '/trips'          => trips#index</li>
  <li>GET `/trips/${id}`    => trips#show</li>
  <li>POST '/trips'         => trips#create</li>
  <li>PATCH `/trips/${id}`  => trips#update</li>
  <li>DELETE `/trips/${id}` => trips#destroy</li>
</ul>
<h5>Trip Families Routes</h5>
<ul>
  <li>POST '/tripfamilies'         => tripfamilies#create</li>
  <li>GET '/tripfamilies'          => tripfamiliess#index</li>
  <li>DELETE `/tripfamilies/${id}` => tripfamilies#destroy</li>
</ul>
<h5>Items Routes</h5>
<ul>
  <li>POST '/items'                            => items#create</li>
  <li>GET `/showitems/${id}`                   => 'items#showitems'</li>
  <li>GET `/showmyitems/${tripId}/${userName}` => 'items#showmyitems'</li>
  <li>PATCH `/items/${tripId}/${itemsArray}/${userName}` => 'items#update_trip_items'</li>
</ul>

<h3>Set Up and Installation</h3>
<ul>
  <li>Download this repo - Click the "Clone or Dowload"
  button and select "Download Zip"</li>
  <li>Unzip and rename the project</li>
  <li>Move into new project and run command ```git init```</li>
  <li>Rename your app module in ```config/application.rb```</li>
  <li>Rename your project database in ```config/database.yml```</li>
  <li>Run command ```bundle install```</li>
  <li>Run commands ```git add all``` and ```git commit```</li>
  <li>Create ```.env``` file to store secret keys</li>
  <li>Run ```bundle exec rails secret``` twice and set ```SECRET_KEY_BASE_<DEVELOPMENT|TEST>``` respectively.</li>
  <li></li>
</ul>

<h3>Set up your database</h3>
<h5>Run below commands</h5>
```
bin/rails db:drop
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails db:examples
```
<h3>Run server!</h3>
<h5>Run ```bin/rails server``` or ```bundle exec rails server``` in your command line.</h5>


<h3>Planning</h3>
<ol>
<li>Started with Wireframe and user stories.</li>
<li>Design database model.</li>
<li>Test user authentication</li>
<li>Create rails models in the backend</li>
<li>Deisgn front-end and perform crud operations.</li>
<li>Testing and Debugging</li>
<li>Add styling</li>
</ol>

<h3>Unsolved Problems</h3>
<p>App allows duplicate trips and items to enter now. Need to validate rows before insertion to avoid duplication.</p>

<h3>Future Goals</h3>
<ol>
  <li>Allow users to upload trip photos</li>
  <li>Show the trip place on Google maps</li>
  <li>Manage trip expenses</li>
</ol>
