# Use an official Node runtime as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install --legacy-peer-deps

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy the rest of the application code to the working directory
COPY . .

# Define build arguments
ARG API_URL
ARG GITHUB_CLIENT_ID
ARG GITHUB_REDIRECT_URI
ARG GITHUB_CLIENT_SECRET
ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Create production environment file from template
RUN cp src/environments/environment.prod.template.ts src/environments/environment.ts && \
    sed -i 's|${API_URL}|'"$API_URL"'|g; s|${GITHUB_CLIENT_ID}|'"$GITHUB_CLIENT_ID"'|g; s|${GITHUB_REDIRECT_URI}|'"$GITHUB_REDIRECT_URI"'|g; s|${GITHUB_CLIENT_SECRET}|'"$GITHUB_CLIENT_SECRET"'|g; s|${DB_HOST}|'"$DB_HOST"'|g; s|${DB_PORT}|'"$DB_PORT"'|g; s|${DB_NAME}|'"$DB_NAME"'|g; s|${DB_USER}|'"$DB_USER"'|g; s|${DB_PASSWORD}|'"$DB_PASSWORD"'|g;' src/environments/environment.ts

RUN echo "Contents of environment.ts:" && cat src/environments/environment.ts

# Build the Angular application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["sh", "-c", "API_URL=$API_URL GITHUB_CLIENT_ID=$GITHUB_CLIENT_ID GITHUB_REDIRECT_URI=$GITHUB_REDIRECT_URI GITHUB_CLIENT_SECRET=$GITHUB_CLIENT_SECRET DB_HOST=$DB_HOST DB_PORT=$DB_PORT DB_NAME=$DB_NAME DB_USER=$DB_USER DB_PASSWORD=$DB_PASSWORD   npm run serve:ssr:pecan"]
