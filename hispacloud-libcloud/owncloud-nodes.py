from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver
'''

Steps:
- Create S3 bucket in Europe. Encrypted
- Setup IAM role for S3 bucket.
- Create 1 servers, provisioned with Ansible owncloud role.
(8GB RAM - Compute instance)
- Bonus: encrypt root device?
- Deploy S3 encryption key to the instance.
- Create a load balancer, add the 4 servers.
- Create an AMI of the owncloud server.
- Bonus: Create an autoscaling script for the node,
    if the resources go over X, create another node and add it
    to the LB.
- Create RDS? Or Galera DB.
- Create a server for Open Documents.
- Bonus: pick best price from a provider.

'''

##aws sts assume-role --role-arn arn:aws:iam::123456789012:role/role-name --role-session-name "RoleSession1" --profile IAM-user-name > assume-role-output.txt
EC2_ACCESS_ID = 'your access id'
EC2_SECRET_KEY = 'your secret key'
# EC2: c4.xlarge
#
OWNCLOUD_NODE_SIZE = ''
OWNCLOUD_IMAGE = ''

def connect_to_aws():
    # conn = EC2Driver(EC2_ACCESS_ID, EC2_SECRET_KEY)
    cls = get_driver(Provider.EC2)
    driver = cls('temporary access key', 'temporary secret key',token='temporary session token',region="us-west-1")
    return driver

def create_owncloud_server(driver):
    # retrieve available images and sizes
    images = driver.list_images()
    # [<NodeImage: id=3, name=Gentoo 2008.0, driver=Rackspace  ...>, ...]
    sizes = driver.list_sizes()
    # [<NodeSize: id=1, name=256 server, ram=256 ... driver=Rackspace ...>, ...]



    size = [s for s in sizes if s.id == OWNCLOUD_NODE_SIZE][0]
    image = [i for i in images if i.id == OWNCLOUD_IMAGE][0]
    node = driver.create_node(name='test', image=images[0], size=sizes[0])
    tags = dict()
    tags['Name'] =
    ## Lookup latest tag:

    driver.ex_create_tags(resource, tags(dict))
