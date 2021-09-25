# Mortgage Calculator

## The project requirements

Ruby 3.0.2
Postgres >= 9.2
NodeJS 14.7.4
Yarn 1.22.11

## Setup local environment

1. [Install NodeJS + Npm](https://nodejs.org/en/download/) on your PC
1. [Install Yarn](https://classic.yarnpkg.com/en/docs/install) on your PC
1. Clone the project repository:
   ```shell
   git clone git@github.com:PulsarV/mortgage_calculator.git && cd mortgage_calculator
   ```
1. Install required gems:
   ```shell
   bundle install
   ```
1. Install required JS packages:
   ```shell
   yarn install
   ```
1. Create the project .env file:
   ```shell
   cp .env.dist .env
   ```
1. Update Postgres server configuration in the ```.env``` file (for local development environment update only ```DB_USER``` and ```DB_PASSWORD```)
1. Create database:
   ```shell
   bundle exec rails db:create
   ```
1. Run migrations:
   ```shell
   bundle exec rails db:migrate
   ```
1. Run local server:
   ```shell
   bundle exec rails s
   ```
1. Open [project](http://localhost:3000) in your browser

## Run linters

1. Rubocop
   ```shell
   bundle exec rubocop
   ```