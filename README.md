### CalendaPlus
A calendar web application for creating, editing, deleting or listing  events. Developed using the MERN stack.
Forked from : https://github.com/juanpmachadob/mern-calendar

### Description
##  Frontend 
  The client side(frontend) of the application which was built with react is on the client branch of this repository.
##  Backend 
  The server side(backend) of the application which was built with nodejs is on the server branch of this repository.
##  Database
  The database used is AzureCosmosDB for MongoDB, which is connected to the backend via a connection string.
 
### Deployment
  The frontend and backend of this appliication are deployed in a single Kubernetes cluster using Azire kubernetes services.
  ## Breakdown
   Docker images were created for both the forntend and backend, and then pushed to the Azure Container Registry. A kuberntes cluster with two node pools and 2 nodes each was then created using Azure Kubernetes Service. Azure kubernetes service was then authorized to pull images from Azure Docker Registry. Through the deployment and service files in the manifests folder, te conatiner images were deployed through kubernetes.
 
As external services (such as browser) cannot directly access the kubernets pod on which the backend is running (service type: ClusterIp), nginx was use das a reverse proxy server to direct api calls from the frontend application to the ip address of the pod on which the backend container is running.

## App Ip address 
  To access the calendaplus application , use the url - http://20.237.201.39/
  
