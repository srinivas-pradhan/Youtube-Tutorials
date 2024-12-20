resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "STATE_MACHINE_NAME_HERE"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = <<EOF
{
  "Comment": "A simple AWS Step Functions state machine that automates a call center support session.",
  "StartAt": "Open Case",
  "States": {
    "Open Case": {
        "Type": "Task",
        "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
        "Next": "Assign Case"
   },
   "Assign Case": {
        "Type": "Task",
        "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
        "Next": "Work on Case"
   },
   "Work on Case":{
        "Type": "Task",
        "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
        "Next": "Is Case Resolved"
   },
   "Is Case Resolved": {
        "Type" : "Choice",
        "Choices": [
            {
             "Variable": "$.Status",
             "NumericEquals": 1,
             "Next": "Close Case"
            },
            {
             "Variable": "$.Status",
             "NumericEquals": 0,
             "Next": "Escalate Case"
            }
        ]
   },
   "Close Case": {
        "Type": "Task",
        "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
        "End": true
  },
   "Escalate Case": {
        "Type": "Task",
        "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
        "Next": "Fail"
  },
    "Fail": {
        "Type": "Fail",
        "Cause": "Engage Tier 2 Support." }
  }
}
EOF
}
