from diagrams import Cluster, Diagram
from diagrams.aws.network import VPC, PublicSubnet, PrivateSubnet, InternetGateway, NATGateway

# Configures a clean layout flow
graph_attr = {
    "splines": "spline",
    "pad": "0.5",
}

with Diagram("AWS Foundation Architecture (Dev)", show=False, filename="dev_architecture", graph_attr=graph_attr, direction="TB"):
    
    igw = InternetGateway("Internet Gateway")
    
    with Cluster("VPC: dev-vpc"):
        vpc = VPC("VPC Core")
        
        with Cluster("Availability Zone A (us-west-2a)"):
            pub_a = PublicSubnet("Public Subnet A")
            nat_a = NATGateway("NAT Gateway A")
            priv_a = PrivateSubnet("Private Subnet A")
            
            # Traffic flow routing
            igw >> pub_a >> nat_a >> priv_a

        with Cluster("Availability Zone B (us-west-2b)"):
            pub_b = PublicSubnet("Public Subnet B")
            nat_b = NATGateway("NAT Gateway B")
            priv_b = PrivateSubnet("Private Subnet B")
            
            igw >> pub_b >> nat_b >> priv_b