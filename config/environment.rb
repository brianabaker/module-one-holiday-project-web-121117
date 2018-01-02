require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

# ActiveRecord::Base.logger.level = 1 # or Logger::INFO

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

require_all 'lib'
