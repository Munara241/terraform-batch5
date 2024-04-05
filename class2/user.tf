
resource "aws_iam_user" "lb" {
  for_each = toset([
    "user1",
    "user2",
    "user3"
    ])
  name = each.key
}


resource "aws_iam_group" "hello" {
  name = "devops"
}

# resource "aws_iam_group_membership" "team" {
#   name = "tf-testing-group-membership"

#   users = [
#     for i in aws_iam_user.lb : i.name  #.name mean variable name from first resource
#                                         #this line equal user1, user2, user3
#   ]

#   group = aws_iam_group.hello.name


