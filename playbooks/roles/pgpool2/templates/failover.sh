#!/bin/bash
# This script is run by failover_command.

set -o xtrace

# Special values:
# 1)  %d = failed node id
# 2)  %h = failed node hostname
# 3)  %p = failed node port number
# 4)  %D = failed node database cluster path
# 5)  %m = new main node id
# 6)  %H = new main node hostname
# 7)  %M = old main node id
# 8)  %P = old primary node id
# 9)  %r = new main port number
# 10) %R = new main database cluster path
# 11) %N = old primary node hostname
# 12) %S = old primary node port number
# 13) %% = '%' character

FAILED_NODE_ID="${1}"
FAILED_NODE_HOST="${2}"
FAILED_NODE_PORT="${3}"
FAILED_NODE_PGDATA="${4}"
NEW_MAIN_NODE_ID="${5}"
NEW_MAIN_NODE_HOST="${6}"
OLD_MAIN_NODE_ID="${7}"
OLD_PRIMARY_NODE_ID="${8}"
NEW_MAIN_NODE_PORT="${9}"
NEW_MAIN_NODE_PGDATA="${10}"
OLD_PRIMARY_NODE_HOST="${11}"
OLD_PRIMARY_NODE_PORT="${12}"

PGHOME=/usr/lib/postgresql/{{ POSTGRES_VERSION }}
REPL_SLOT_NAME=${FAILED_NODE_HOST//[-.]/_}


echo failover.sh: start: failed_node_id=$FAILED_NODE_ID failed_host=$FAILED_NODE_HOST \
  old_primary_node_id=$OLD_PRIMARY_NODE_ID new_main_node_id=$NEW_MAIN_NODE_ID new_main_host=$NEW_MAIN_NODE_HOST \
  $(date) >> /var/log/postgresql/exec.log

## If there's no main node anymore, skip failover.
if [ $NEW_MAIN_NODE_ID -lt 0 ]; then
  echo failover.sh: All nodes are down. Skipping failover.
  exit 0
fi

## Test passwordless SSH
ssh -T -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null postgres@${NEW_MAIN_NODE_HOST} -i ~/.ssh/{{SSH_KEYID}} ls /tmp > /dev/null

if [ $? -ne 0 ]; then
  echo failover.sh: passwordless SSH to postgres@${NEW_MAIN_NODE_HOST} failed. Please setup passwordless SSH.
  exit 1
fi

## If Standby node is down, skip failover.
if [ $FAILED_NODE_ID -ne $OLD_PRIMARY_NODE_ID ]; then
  # If Standby node is down, drop replication slot.
  ${PGHOME}/bin/psql -h ${OLD_PRIMARY_NODE_HOST} -p ${OLD_PRIMARY_NODE_PORT} \
      -c "SELECT pg_drop_replication_slot('${REPL_SLOT_NAME}');"  >/dev/null 2>&1

  if [ $? -ne 0 ]; then
    echo ERROR: failover.sh: drop replication slot \"${REPL_SLOT_NAME}\" failed. You may need to drop replication slot manually.
  fi

  echo failover.sh: end: standby node is down. Skipping failover.
  exit 0
fi

## Promote Standby node.
echo failover.sh: primary node is down, promote new_main_node_id=$NEW_MAIN_NODE_ID on ${NEW_MAIN_NODE_HOST}.

ssh -T -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
  postgres@${NEW_MAIN_NODE_HOST} -i ~/.ssh/{{SSH_KEYID}} ${PGHOME}/bin/pg_ctlcluster -D ${NEW_MAIN_NODE_PGDATA} -w promote

if [ $? -ne 0 ]; then
  echo ERROR: failover.sh: end: failover failed
  exit 1
fi

echo failover.sh: end: new_main_node_id=$NEW_MAIN_NODE_ID on ${NEW_MAIN_NODE_HOST} is promoted to a primary
exit 0
