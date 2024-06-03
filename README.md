# Typerek

Welcome to Typerek! This application allows you and your friends to predict the outcomes of upcoming football championship matches. Follow the instructions below to set up the application in production mode using Docker Compose.

## Quick Start

### Prerequisites
- **Operating System**: Windows, macOS, or Linux
- **Software**: Docker, Docker Compose

### Installation & Configuration

1. **Clone the Repository**
    ```bash
    git clone https://github.com/your-username/typerek.git
    cd typerek
    ```

2. **Create .env File**
   Create a `.env` file in the root directory based on `.env.example` with the following variables:
   ```plaintext
   export COMPOSE_PROFILES=postgres,web
   export COMPOSE_PROJECT_NAME=typerek
   export DOCKER_BUILDKIT=1
   export DOCKER_RESTART_POLICY=unless-stopped
   export DOCKER_WEB_PORT_FORWARD=8000
   export DOCKER_WEB_VOLUME=./public:/app/public
   export PORT=8000
   export POSTGRES_PASSWORD=password
   export POSTGRES_USER=postgres
   export RAILS_ENV=production
   export RAILS_LOG_TO_STDOUT=true
   export RAILS_MAX_THREADS=5
   export RAILS_SERVE_STATIC_FILES=true
   export SECRET_KEY_BASE=insecure_key_for_dev
   export TYPEREK_ADMIN_PASSWORD=password1!
   export TYPEREK_ADMIN_USERNAME=admin
   export WEB_CONCURRENCY=2
   ```
   
   For development use following variables:
   ```plaintext
   export COMPOSE_PROFILES=postgres,web
   export COMPOSE_PROJECT_NAME=typerek
   export DOCKER_BUILDKIT=1
   export DOCKER_RESTART_POLICY=no
   export DOCKER_WEB_PORT_FORWARD=8000
   export DOCKER_WEB_VOLUME=.:/app
   export PORT=8000
   export POSTGRES_PASSWORD=password
   export POSTGRES_USER=postgres
   export RAILS_ENV=development
   export RAILS_LOG_TO_STDOUT=true
   export RAILS_MAX_THREADS=1
   export RAILS_SERVE_STATIC_FILES=true
   export SECRET_KEY_BASE=insecure_key_for_dev
   export TYPEREK_ADMIN_PASSWORD=password1!
   export TYPEREK_ADMIN_USERNAME=admin
   export WEB_CONCURRENCY=1
   ```

### Running the Application

1. **Build and Run the Containers**
    ```bash
    docker-compose up --build -d
    ```

2. **Set Up the Database with Seed Data**
    ```bash
    docker-compose exec web rails db:setup
    ```

3. **Access the Application**
   Open your browser and navigate to `http://localhost:8000`

---

If you encounter any issues or have questions, feel free to open an issue or contact the project maintainers.

Happy predicting!