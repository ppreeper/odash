if [ -z "${args[target]}" ]; then
  ansible all -m ping -v
else
  ansible ${args[target]} -m ping -v
fi