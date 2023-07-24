[ "${args[target]}" = "localhost" ] && export BECOME="-K" || export BECOME=""
echo ansible-playbook -b ${PLAYBOOK_DIR}/${args[playbook]}.yml $BECOME
ansible-playbook -b ${PLAYBOOK_DIR}/${args[playbook]}.yml $BECOME