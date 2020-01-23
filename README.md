# A book quiz

## Introduction

A few questions about classic books and authors.

There are five questions, and once they are all answered, you can see how other quiz-takers answered.

## Install

```
$ git clone --depth 1 git@github.com:MattHeard/quiz.git
$ bundle
```

## Run the web server

```
$ bundle exec rails server
```

Visit `http://localhost:3000/` to visit the start page.

## Run the automated tests

```
$ bundle exec rspec
```

There is a suite of unit tests to validate the logic and one request test as a
regression smoke test for the happy case user flow.
