alias ec2-instances="aws ec2 describe-instances --query 'Reservations[].Instances[].join(\`,\`, [@.InstanceId, @.Tags[?Key==\`Name\`].Value | [0] || \`\`, @.NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | [0] || \`\`])' | jq -r .[]"
alias prod-instances="assume-role prod ReadOnly && ec2-instances | grep WebApp | grep -v ',$'"
alias one-prod-instance="prod-instances | tail -n1 | sed -e 's/.*,/ssh ec2-user@/' | pbcopy"
alias opr="one-prod-instance"
