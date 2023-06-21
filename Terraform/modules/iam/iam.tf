# IAM Role policy document
data "aws_iam_policy_document" "this" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = var.effect
    actions = var.actions

    principals {
      type        = var.principal_type
      identifiers = var.principal_identifiers
    }
  }
}


# Create IAM role
resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.this.json
}

# Attach Policy to role
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arn
}