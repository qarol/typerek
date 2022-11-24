# Typerek

Typerek is a simple application that will help you find the answer to the question 
"Who among your friends better predicts the game result better?".

## Installation

### Requirements

* Docker

### Run

1. Clone the repository
2. Copy `.env.example` to `.env` and uncomment desired environment variables (Development or Production)
3. Run `docker-compose up -d --build` to build and run the application
4. Run `docker-compose exec web rake db:setup` to create the database and run migrations
5. Visit `http://localhost:3000` to see the application in action

For rebuilding the application run `docker-compose up -d --build --force-recreate`.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
