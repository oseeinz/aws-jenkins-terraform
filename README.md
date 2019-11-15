# aws-jenkins-terraform

## Overview

devOps workflow with Terraform, packer, ansible and Jenkins to provision HA evnironment with httpd and Tomcat.

## General Requirements

* Terraform installed on Jenkins server
* Correct plugins installed on Jenkins
* GitHub access token
* AWS credentials
* S3 bucket
* Terraform v0.12.14

## Requirements for Terraform
* data aws_ami (in data.tf) requires pre-backed ami from packer build

* AWS CLI installed jenkins sev


## Setup Bucket

You will need to create a bucket and reference the bucket name in the following section of `s3_backend.tf`:

```
terraform {
  backend "s3" {
    bucket = "terraform-bucket-name"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```
## Configure Anisible-local in Packer Provisioner
* Make sure to specify the playbook and role path for ansible in packer provisioner

## Plugins Required for Jenkins

* [Workspace Cleanup Plugin](https://wiki.jenkins.io/display/JENKINS/Workspace+Cleanup+Plugin)
* [Credentials Binding Plugin](https://wiki.jenkins.io/display/JENKINS/Credentials+Binding+Plugin)
* [AnsiColor Plugin](https://wiki.jenkins.io/display/JENKINS/AnsiColor+Plugin)
* [GitHub Plugin](https://wiki.jenkins.io/display/JENKINS/GitHub+Plugin)
* [Pipeline Plugin](https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin)
* [CloudBees AWS Credentials Plugin](https://wiki.jenkins.io/display/JENKINS/CloudBees+AWS+Credentials+Plugin)
