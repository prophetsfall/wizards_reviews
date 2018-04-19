# Wizard Watch!
[![Build Status](https://codeship.com/projects/36b938f0-e1cd-0135-f6ea-7aa86eca2b9b/status?branch=master)]()
[![Code Climate](https://codeclimate.com/github/prophetsfall/wizards_reviews/badges/gpa.svg)](https://codeclimate.com/github/prophetsfall/wizards_reviews)
[![Coverage Status](https://coveralls.io/repos/github/prophetsfall/wizards_reviews/badge.svg?branch=master)](https://coveralls.io/github/prophetsfall/wizards_reviews?branch=master)

### Intro

This project is a product of the efforts of [Ian Brooks](https://github.com/iBrooks), [James Hartman](https://github.com/JauntyJames), [Al Martin](https://github.com/alcodes299), [Pat Whelan](https://github.com/prophetsfall) and Taylor Yount. It showcases our collective first effort in creating a full-stack CRUD web application from scratch, and was made using Agile methodology, github workflow, and pair programming. See the production website at [Wizard Watch](http://wizard-reviews.herokuapp.com)

### To run

 - Clone down the repo
 - `bundle install`
 - `npm install`
 - `rake db:setup`
 - `rails server`
 - `npm start`
 - navigate your browser to `localhost:3000`
 - to run the testing suite, run `rake spec`
 - to test React components, run `npm test`

 
### Highlights

- Custom CSS on top of a Foundation framework
- Full Create, Read, Update, Destroy actions for 5 different Activerecord models
- Single-page navigation from React-Router
