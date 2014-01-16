##iptables

This element installs a single script that consolidates the logic required
to handle inserting iptables rules. This script uses the check (-C) argument
to check whether a rule matching the specification does exist in the selected
chain before inserting it.

RULE: The rule to insert into iptables