# photogenerator-ai-backend
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/Mahaveermandloi/photogenerator-ai-backend)

This repository contains the backend service for an AI-powered photo and content generator. It is a Spring Boot application that leverages the Spring AI project to integrate with OpenAI's models for generating images, text-based chat responses, and structured content like recipes.

## Features

*   **Image Generation**: Creates images from textual descriptions using OpenAI's DALL-E 2 model.
*   **AI Chat**: Provides a conversational endpoint that uses OpenAI's GPT models (e.g., gpt-4o) for generating text-based responses.
*   **Recipe Creator**: Generates detailed recipes based on a list of ingredients, preferred cuisine, and dietary restrictions.
*   **Containerized**: Includes a `Dockerfile` for easy building and deployment.

## API Endpoints

The service exposes the following REST endpoints. The server runs on port `3000`.

### Chat Endpoints

**1. General AI Chat**
-   `GET /ask-ai`
-   Generates a simple text response to a given prompt.
-   **Query Parameters:**
    -   `prompt` (String, required): The user's input/question.
-   **Example:** `GET /ask-ai?prompt=What%20is%20Spring%20Boot`

**2. Chat with Options**
-   `GET /ask-ai-options`
-   Generates a text response using specific model options (GPT-4o, temperature, etc.).
-   **Query Parameters:**
    -   `prompt` (String, required): The user's input/question.
-   **Example:** `GET /ask-ai-options?prompt=Explain%20quantum%20computing%20simply`

### Image Generation

**1. Generate Image(s)**
-   `GET /generate-image`
-   Generates one or more images based on a prompt and returns their URLs.
-   **Query Parameters:**
    -   `prompt` (String, required): A textual description of the desired image.
    -   `n` (int, optional, default: 1): The number of images to generate.
    -   `width` (int, optional, default: 1024): The width of the generated image(s).
    -   `height` (int, optional, default: 1024): The height of the generated image(s).
-   **Example:** `GET /generate-image?prompt=A%20futuristic%20cityscape%20at%20dusk&n=2`

### Recipe Generation

**1. Create a Recipe**
-   `GET /recipe-creator`
-   Generates a full recipe from a list of ingredients.
-   **Query Parameters:**
    -   `ingredients` (String, required): A comma-separated list of ingredients.
    -   `cuisine` (String, optional, default: "any"): The desired cuisine type (e.g., "Italian", "Mexican").
    -   `dietaryRestrictions` (String, optional): Any dietary restrictions to consider (e.g., "vegetarian", "gluten-free").
-   **Example:** `GET /recipe-creator?ingredients=chicken,rice,tomatoes&cuisine=Mexican`

## Technologies Used

-   **Java 21**
-   **Spring Boot 3**
-   **Spring AI** (for OpenAI Integration)
-   **Maven**
-   **Docker**

## Getting Started

### Prerequisites

-   Java JDK 21 or later
-   Maven
-   An OpenAI API Key

### Configuration

The application requires an OpenAI API key to function. This should be provided as an environment variable.

1.  Create an environment variable named `SPRING_AI_OPENAI_API_KEY`.
2.  Set its value to your OpenAI API key.

```bash
export SPRING_AI_OPENAI_API_KEY="your_openai_api_key"
```

### Running Locally

1.  Clone the repository:
    ```sh
    git clone https://github.com/mahaveermandloi/photogenerator-ai-backend.git
    cd photogenerator-ai-backend
    ```

2.  Run the application using the Maven wrapper:
    ```sh
    ./mvnw spring-boot:run
    ```

The application will start on `http://localhost:3000`.

## Docker Usage

You can also build and run the application as a Docker container.

### Build the Docker Image

From the root directory of the project, run the following command:

```sh
docker build -t photogenerator-ai-backend .
```

### Run the Docker Container

Run the container, making sure to pass your OpenAI API key as an environment variable and map the port.

```sh
docker run -p 3000:3000 \
  -e SPRING_AI_OPENAI_API_KEY="your_openai_api_key_here" \
  photogenerator-ai-backend
```

The service will be accessible at `http://localhost:3000`.
