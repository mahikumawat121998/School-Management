# Use Node.js as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Run Prisma migrations automatically on startup
RUN npx prisma generate

# Expose the port the app runs on
EXPOSE 3000

# Start script (Apply Migrations Before Starting App)
CMD npx prisma migrate deploy && npm start
