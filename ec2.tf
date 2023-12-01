resource "aws_ecs_cluster" "my_cluster" {
  name = "mchalhi-ecs-cluster"
}

resource "aws_ecs_task_definition" "my_task_definition" {
  family                = "my-task-family"
  container_definitions = jsonencode(
[
  {
    "name": "mchalhi-container",
    "image": "nginx:latest",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
)
}

resource "aws_ecs_service" "my_ecs_service" {
  name            = "mchalhi-ecs-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets = [
      aws_subnet.my_subnet1.id,
      aws_subnet.my_subnet2.id
    ]
    security_groups = [
      aws_security_group.my_security_group.id
    ]
    assign_public_ip  = "true"
  }
}
