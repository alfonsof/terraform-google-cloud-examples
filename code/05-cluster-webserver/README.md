# Terraform Cluster Web Server example

This folder contains a cluster of web servers example of a [Terraform](https://www.terraform.io/) file on Google Cloud Platform (GCP).

This Terraform file deploys a cluster of web servers on Google Cloud Platform (GCP) using Google Compute Engine and Auto Scaling, as well as a load balancer using Google Cloud Load Balancing.

The cluster of web servers returns "Hello, World" for the URL `/`. The load balancer listens on port 80.

## Requirements

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Google Cloud Platform (GCP)](https://cloud.google.com/) account.
* You must have downloaded a Google Cloud Platform credentials file.
* You must have enabled the Google Compute Engine API.
* It uses the Terraform Google Cloud Provider that interacts with the many resources supported by Google Cloud Platform (GCP) through its APIs.
* This code was written for Terraform 0.10.x.

## Using the code

* Configure your Google Cloud access keys.

  Two ways in order to configure credentials:

  * Configure `GOOGLE_APPLICATION_CREDENTIALS` environment variable. The variable must contain the path to the credentials file.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="~/.gcloud/terraform-examples-code.json"
    ```

    To set these variable on Windows, use `set`:

    ```bash
    set GOOGLE_APPLICATION_CREDENTIALS="C:\Users\USERNAME\.gcloud\terraform-examples-code.json"
    ```

  * Configure `GOOGLE_CREDENTIALS` environment variable. The variable must contain the content of the credentials file and not the path to it.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_CREDENTIALS="$(cat ~/.gcloud/terraform-examples-code.json)"
    ```

* Initialize working directory.

  The first command that should be run after writing a new Terraform configuration is the `terraform init` command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.

  ```bash
  terraform init
  ```

* Modify configuration.

  The web server is listening on port 80, which is defined as an input variable `server_port` in `vars.tf` file.

  If you want to modify the server port you will be able to do it in several ways:

  * Loading variables from command line flags.

    Run Terraform commands in this way:

    ```bash
    terraform plan -var 'server_port=80'
    ```

    ```bash
    terraform apply -var 'server_port=80'
    ```

  * Loading variables from a file.

    When Terraform runs it will look for a file called `terraform.tfvars`. You can populate this file with variable values that will be loaded when Terraform runs. An example for the content of the `terraform.tfvars` file:

    ```bash
    server_port = "80"
    ```

  * Loading variables from environment variables.

    Terraform will also parse any environment variables that are prefixed with `TF_VAR`. You can create an environment variable `TF_VAR_server_port`:

    ```bash
    TF_VAR_server_port=80
    ```

  * Variable defaults.

    Change the value of the `default` attribute of `server_port` input variable in `vars.tf` file.

* Validate the changes.

  Run command:

  ```bash
  terraform plan
  ```

* Deploy the changes.

  Run command:

  ```bash
  terraform apply
  ```

* Test the cluster of web servers.

  When the `terraform apply` command completes, it will output the public IP address of the load balancer.

  You can test it in two ways:
  
  * Running this command:

    ```bash
    curl http://<load_balancer_public_ip>/
    ```

  * Writing in your browser this URL: `http://<load_balancer_public_ip>/`

  You should get a `Hello, World` response message.

* Clean up the resources created.

  When you have finished, run command:

  ```bash
  terraform destroy
  ```