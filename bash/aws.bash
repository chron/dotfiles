alias ec2-instances="aws ec2 describe-instances --query 'Reservations[].Instances[].join(\`,\`, [@.InstanceId, @.Tags[?Key==\`Name\`].Value | [0], @.NetworkInterfaces[].PrivateIpAddresses[].PrivateIpAddress | [0] || \`\`])' | jq -r .[]"