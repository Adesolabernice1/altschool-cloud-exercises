#  Deployment 
- Deploying with terraform

## Pre-requisites

- Install AWS CLI
- Install Terraform

### Setup AWS credentials


### Clone the project repo from github
```
git clone https://github.com/adesolabernice1/exam
```

Move into the terraform directory
```
cd terraform
```

Initialize Terraform
```
terraform init
```

Validate and Plan terraform
```
terraform plan
```

Deploy infrastructure
```
terraform apply -auto-approve
```

Once your terraform apply command runs successfully, run the following command to retrieve the access credentials for your cluster and configure `kubectl`.

Update `kubeconfig`
```ruby
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```

<!-- 
Use the kubectl command to connect to the EKS Cluster and control it
```bash
kubectl get nodes
```

```ruby
aws eks describe-cluster --region $(terraform output -raw region) --name $(terraform output -raw cluster_name) --query "cluster.status"
```
 -->

If successful you will get the following output.
```bash
Added new context arn:aws:eks:<aws-region>:<aws-accunt-id>:cluster/<cluster-name> to /Users/<your-user>/.kube/config
```

You can now use `kubectl` to manage your cluster and deploy Kubernetes configurations to it.

### Verify the Cluster Status

Use `kubectl` commands to verify your cluster configuration.

First, get information about the cluster.
```bash
kubectl cluster-info
```

### Deploy the Sock-Shop microservice

```bash
kubectl apply -f complete-demo.yml
```

The `complete-demo.yml` deployment creates a `sock-shop` namespace automatically

Switch to the `sock-shop` namespace
```bash
kubectl config set-context --current --namespace=sock-shop
```

Run the following command to show all your pods 
```bash
kubectl get pods
```

 Verify that all three worker nodes are part of the cluster
```bash
kubectl get nodes
```

### Install Ingress

```bash
kubectl apply -f ingress.yml
```

Verify that the Ingress controller is running

```bash
kubectl get pods -l "app.kubernetes.io/name=aws-load-balancer-controller"
```

By now your deployments should be exposed by an application load balancer




