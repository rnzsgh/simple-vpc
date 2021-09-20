REGION ?= us-east-1
PROFILE ?= test

.PHONY: create-stack
create-stack:
	@aws cloudformation create-stack \
  --profile $(PROFILE) \
  --stack-name simple-vpc \
  --region $(REGION) \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body file://vpc.cfn.yml \
	--parameters file://vpc-$(REGION).json

.PHONY: delete-stack
delete-stack:
	@aws cloudformation delete-stack \
  --profile $(PROFILE) \
  --stack-name simple-vpc \
  --region $(REGION)

.PHONY: update-stack
update-stack:
	@aws cloudformation update-stack \
  --profile $(PROFILE) \
  --stack-name simple-vpc \
  --region $(REGION) \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body file://vpc.cfn.yml \
	--parameters file://vpc-$(REGION).json
