# jso_users

A simple repository to run a GitHub action periodically that collects dependents of each package with the JSO organization.
Because that is a highly time-consuming process, the lists of dependents are published as releases.
They can then be consumed by `Breakage.yml` workflows within JSO.
