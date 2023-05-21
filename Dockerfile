FROM node:current-alpine AS appbuild
# COPY . /app
# COPY package.json ./
# WORKDIR /app
# # RUN apk update && \
# #     apk upgrade && \
# #     apk add --no-cache nodejs npm 
# RUN npm install
# ENTRYPOINT [ "npm start" ]
# EXPOSE 3000

# WORKDIR /app
# COPY package.json ./
# # COPY package-lock.json ./
# RUN npm install

# COPY . ./

# CMD ["npm", "start"]
# EXPOSE 3000

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code
COPY . .

# Build the React app
RUN npm run build

# # Set the environment variable
# ENV NODE_ENV=production

# # Expose the port on which the app will run (change as per your React app's requirements)
# EXPOSE 3000

# # Start the app
# CMD ["npm", "start"]

FROM nginx:alpine

COPY ./.nginx/nginx.conf  /etc/nginx/conf.d/default.conf

# ## Remove default nginx index pagec
# RUN rm -rf /usr/share/nginx/html/*

# Copy from the stage 1
COPY --from=appbuild /app/build /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]