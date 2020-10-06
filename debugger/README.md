The debugger can be enabled in your ansible configuration file(ansible.cfg)

```
[defaults]
enable_task_debugger = True
```

or set as an environment variable

```
ANSIBLE_ENABLE_TASK_DEBUGGER=True ansible-playbook -i hosts site.yml
```

## multi-level debugger

task level

```
- name: execute a command
  command: false
  debugger: on_failed
```

play level

```
- name: play
  hosts: all
  debugger: on_skipped
  tasks:
  - name: execute a command
    command: true
    when: False
```

or more specific one wins

```
- name: paly
  hosts: all
  debugger: never
  tasks:
  - name: execute a command
    command: false
    debugger: on_failed
```
