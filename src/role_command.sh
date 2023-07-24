[ "${args[playbook]}" = "localhost" ] && export BECOME="-K" || export BECOME=""
echo ansible-playbook -l ${args[target]} -e role=${args[role]} -b ${PLAYBOOK_DIR}/apply_role.yml $BECOME
ansible-playbook -l ${args[target]} -e role=${args[role]} -b ${PLAYBOOK_DIR}/apply_role.yml $BECOME