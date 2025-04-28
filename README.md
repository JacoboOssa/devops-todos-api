# ToDos API

This project is a microservice for managing ToDos, built with Node.js. It includes a CI/CD pipeline configured with Azure DevOps to automate building, testing, and deploying the application.

## Features
- RESTful API for managing ToDos.
- Dockerized for containerized deployments.
- CI/CD pipeline for automated builds and deployments.

## Project Structure
- `server.js`: Entry point of the application.
- `routes.js`: Defines API routes.
- `todoController.js`: Contains the business logic for ToDos.
- `Dockerfile`: Configuration for building the Docker image.
- `azure-pipelines.yml`: CI/CD pipeline configuration.

## CI/CD Pipeline
The pipeline is defined in the `azure-pipelines.yml` file and includes the following stages:

1. **Trigger**: The pipeline is triggered on changes to the `main` branch.
2. **Build and Push Stage**:
   - Logs in to the Azure Container Registry (ACR).
   - Builds a Docker image for the ToDos API.
   - Pushes the image to the ACR.
3. **Deployment**:
   - Deploys the Docker image to an Azure Container App.

### Pipeline Configuration
- **Azure Container Registry**:
  - Service Connection: `ACR-ingesoft5acrregistry-Connection`
  - Login Server: `testacrgyvpcp.azurecr.io`
  - Image Repository: `todos-api`
- **Azure Container App**:
  - Name: `test-todos-api-ca`
  - Resource Group: `rg-app-testing`
  - Azure Resource Manager Connection: `AzureRM-microservice`

## How to Run Locally
1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   node server.js
   ```

## How to Build and Deploy
The CI/CD pipeline automates the build and deployment process. Simply push changes to the `main` branch, and the pipeline will:
- Build the Docker image.
- Push the image to the ACR.
- Deploy the image to the Azure Container App.

## Adding the Pipeline to Azure DevOps

To set up the CI/CD pipeline in Azure DevOps, follow these steps:

1. **Create a New Pipeline**:
   - Navigate to your Azure DevOps project.
   - Go to the "Pipelines" section and click on "New Pipeline."

2. **Select the Repository**:
   - Choose the repository where this project is hosted (e.g., GitHub, Azure Repos).

3. **Configure the Pipeline**:
   - Select "Existing Azure Pipelines YAML file."
   - Specify the path to the `azure-pipelines.yml` file in the repository (e.g., `/azure-pipelines.yml`).

4. **Save and Run**:
   - Save the pipeline configuration.
   - Run the pipeline to ensure it works as expected.

5. **Monitor Pipeline Runs**:
   - After the pipeline is set up, you can monitor its runs in the "Pipelines" section of Azure DevOps.

This will enable automated builds and deployments for the project.

## License
This project is licensed under the MIT License.