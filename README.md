# Spark IDE Example
This project is a small example showing typical lifecycle
operations undertaken by a developer who is building
components to be used within Databricks remotely. We have
chose to demonstrate this with PyCharm however this could
be done with VSCode or others.

## Known Issues
Some callouts before we begin:

* We are using dbx as the integration method though intend to switch to spark-connect once it is Public Preview
* We are not working in a Unity Catalog workspace (for now)
* We are using Azure Databricks as our backend
* We are doing this on Windows, Macs are cool but most public sector employees will be on a Windows environment

## Prerequisites
To run the work here, you'll need to have:
* Azure CLI installed and setup. 
  * You should have run "az login"
  * selected the right directory
      
        az account set --subscription \<name or id\>"
    
  * Note: can see what Azure directories are available with:
  
        az account list -o table
* PyCharm installed
* JDK installed, this setup was tested with JDK 1.8.0_141
* If you want to deploy to PyPi, you'll need credentials

## Getting Started
So much to do, so little time:-) I'll use this list both as a tracker for myself
as well as a way to document steps to get things going.

1. TODO - Setup Workspace
2. TODO - Configure PAT token
3. TODO - Setup Workspace Objects
4. TODO - Open PyCharm project "example-project"

### Setup Workspace
If you have an existing development workspace, you can skip most of these instructions 
though you will need to update "workspace_context.json". Otherwise you will need
to go to run:

      cd ./terraform/workspace
      terraform init
      terraform apply

This will create an Azure Databricks workspace which also has the Data Engineering 
repositories added. 

### Configure PAT token
To remotely work in the workspace created, you may need to create a PAT token, please
ensure this is done before proceeding.

### Setup Workspace Objects
If you already



