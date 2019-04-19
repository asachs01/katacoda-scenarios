Using the interactive terminal, you can see that we have a running Sensu backend (`service sensu-backend status`{{execute}}) and Sensu agent (`service sensu-agent status`{{execute}}).

(Click on a command to run it in the terminal!)

To get started, configure sensuctl as the default admin user: `sensuctl configure -n --username "admin" --password 'P@ssw0rd!' --url "http://127.0.0.1:8080"`{{execute}}.

Now you can use sensuctl to see the latest montioring events: `sensuctl event list`{{execute}}.
