# charts

## About this repository

This is the staging area for internal helm charts used in my homelab and part of the core repositories. Charts in this repo is pushed to the `alpha` branch and should
only be used for testing.

### Core

| **Name**                                                                                  | **Description**                                      |
| ----------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [**clusters**](https://github.com/ministryofjustice/cloud-platform)                       | Flux entrypoint for Kubernetes clusters              |
| [**applications**](https://github.com/ministryofjustice/cloud-platform-environments)      | Misc. application deployments                        |
| [**infrastructure**](https://github.com/ministryofjustice/cloud-platform-infrastructure)  | Core infrastructure for Kubernetes cluster           |
| [**databases**](https://github.com/ministryofjustice/cloud-platform-infrastructure)       | Standalone or non-application specefic databases     |
| [**terraform**](https://github.com/ministryofjustice/cloud-platform-user-guide)           | Core infrastrucutre for kubernetes deployment and vm |
| [**charts** _(this one)_](https://github.com/ministryofjustice/cloud-platform-user-guide) | Staging area for helm charts                         |

## Components

This repository contains the following components:

| **Component** | **Description**                          |
| ------------- | ---------------------------------------- |
| **`charts/`** | contains the charts prepared for staging |

> **Note:** `beta` and `tagged/release` charts are found in their own repo - `github.com/ganawaj/[name]-helm`
