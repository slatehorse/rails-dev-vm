# Based on https://github.com/rails/rails-dev-box/blob/master/bootstrap.sh

# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo adding swap file
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap defaults 0 0' >> /etc/fstab

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential libreadline-dev

install Ruby ruby2.3 ruby2.3-dev
update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

install Git git
install Redis redis-server

echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
apt-get-y update >/dev/null 2>&1
install RabbitMQ rabbitmq-server

# set up Rabbit
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user admin password
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p / admin ".*" ".*" ".*"

install SQLite libsqlite3-dev
install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser ubuntu

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'Blade dependencies' libncurses5-dev
install 'ExecJS runtime' nodejs

echo installing pry
gem install pry >/dev/null


# For Ruby Koans
echo installing observr
gem install observr >/dev/null

echo installing rails
gem install rails >/dev/null

# For adventure game
install Emacs emacs24

# Needed for docs generation.
locale-gen "en_GB.UTF-8"
dpkg-reconfigure locales
update-locale LANG=en_GB.UTF-8 LANGUAGE=en_GB.UTF-8 LC_ALL=en_GB.UTF-8

echo 'all set, rock on!'