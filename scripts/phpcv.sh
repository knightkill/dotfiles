valet stop

brew unlink php
brew unlink php@8.0
brew unlink php@7.4
brew unlink php@7.1
brew unlink php@5.6
brew unlink php@5.5

# Check if a PHP version was specified as an argument
if [ $# -eq 1 ]; then
    # If one argument is provided, use it as the required PHP version
    brew link php@$1
    php_version="@$1"
else
    echo "Error: Please provide exactly one PHP version as an argument."
    exit 1
fi

> ~/.php_exports
echo "export PATH=\"/opt/homebrew/opt/php${php_version}/bin:\$PATH\"" >> ~/.php_exports
echo "export PATH=\"/opt/homebrew/opt/php${php_version}/sbin:\$PATH\"" >> ~/.php_exports

valet use --force php@$1

composer global dump-autoload
composer global update
valet restart
