resource "aws_security_group" "my_security_group" {
  name        = "MySecurityGroup"
  description = "My security group description"
  vpc_id      = aws_vpc.my_vpc.id

  // Autoriser le trafic SSH depuis n'importe quelle source
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Autoriser le trafic HTTP depuis n'importe quelle source
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Autoriser le trafic sortant vers toutes les destinations
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
