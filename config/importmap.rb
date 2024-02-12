# Pin npm packages by running ./bin/importmap

pin "application"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "jquery", to: "jquery.min.js", preload: true
