source ~/.ssh-agent-source
ssh-add -l >&/dev/null
if [[ $? -eq 2 ]]; then
  ssh-agent > ~/.ssh-agent-source
  source ~/.ssh-agent-source
fi
