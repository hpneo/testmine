# Redmine plugin

## Install models

`RAILS_ENV=production rake redmine:plugins:migrate`

## Structure

```
Project
  Test Suite
    Test Case
  Test Plan
    Test Run (Execution)
      Test Result (Report)
```

## Features

* Drag-n-drop para cambiar cases entre suites
* Agregar steps dinámicamente