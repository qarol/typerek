# Pin npm packages by running ./bin/importmap

pin "application"
pin "jquery" # @3.7.1
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "bootstrap", to: 'bootstrap.min.js', preload: true
