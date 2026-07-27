## Create multiple EC2 instances:


The recommended way to create multiple EC2 instances in Terraform is to use count or for_each.


### `count` vs `for_each`

- Use `count` when creating several identical EC2 instances.
- Use `for_each` when instances need different names, instance types, subnets, or other settings. It is generally the preferred approach for production Terraform configurations because changes are easier to manage without affecting unrelated instances.


| Feature                                     | `count` | `for_each` |
| ------------------------------------------- | ------- | ---------- |
| Create identical instances                  | ✅       | ✅          |
| Unique names                                | Limited  | ✅          |
| Different instance types                    | ❌       | ✅          |
| Different subnets                           | ❌       | ✅          |
| Easier updates without resource renumbering | ❌       | ✅          |
| Recommended for production                  | ❌       | ✅          |




