## EC2 instanc:


### Prerequisites: 
- AWS Account
- IAM User with EC2 permissions
- AWS CLI configured (aws configure)
- Terraform installed




### Terraform Deploy: 



_Initialize Terraform:_
```
terraform init
```


_Validate:_
```
terraform validate
```


_Preview Changes:_
```
terraform plan
```


_Create Resources:_
```
terraform apply
```


_Inspect state:_
```
terraform state list
```


```
terraform show
```


```
terraform output
```


_Destroy Resources:_
```
terraform destroy
```



### Enable tab completion:

```
touch ~/.bashrc
```


```
terraform -install-autocomplete
```




### EC2 instance Querying using CLI: 

_AWS CLI Configure:_
```
aws configure
```


_Custom profile:_
```
aws configure --profile=localstack
aws configure --profile=aws_dev
```


_Check configuration:_
```
aws configure list
```



_Check your AWS region:_
```
aws ec2 describe-availability-zones
```


_List all security groups:_
```
aws ec2 describe-security-groups
```




_List images ID:_
```
aws ec2 describe-images | grep ImageId
```


_List of subnets:_
```
aws ec2 describe-subnets --query "Subnets[*].[SubnetId,VpcId,AvailabilityZone,CidrBlock]" --output table
```


_List all instances:_
```
aws ec2 describe-instances
```


_Get only running instances:_
```
aws ec2 describe-instances --filters "Name=instance-state-name,Values=running"
```


_List only Instance IDs:_
```
aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text
```


_Check AMI id:_
```
aws ec2 describe-instances --instance-ids i-d40abc4c2b10ddb95 --query "Reservations[].Instances[].StateReason" 
```


_Verify the instance state and reason:_
```
aws ec2 describe-instances --instance-ids i-d40abc4c2b10ddb95 --query 'Reservations[].Instances[].{State:State.Name,Reason:StateReason}'
```



_Get Names and IPs of all instances:_
```
aws ec2 describe-instances --query "Reservations[*].Instances[*].[Tags[?Key=='Name'].Value | [0], PublicIpAddress]" --output table 
```





