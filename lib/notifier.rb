
require 'notifier/smtp'
require 'yaml'

module Notifier

  class Program

    CFG_FILE = '~/.notifier'

    def run
      cfg = load_config
      smtp_cfg = cfg['smtp']
      notifier = SmtpNotifier.new(smtp_cfg['host'], smtp_cfg['port'].to_i, smtp_cfg['username'], smtp_cfg['password'], cfg['email'])
      notifier.notify(ARGV[0], ARGV[1])
    end

    def validate_args
      if ARGV.length != 2
        puts "USAGE: notifier [title] [message]"
        exit 0
      end
    end

    def cfg_path
      File.expand_path(CFG_FILE)
    end 

    def create_config
        cfg = {
            'smtp' => { 'host' => '', 'port' => '', 'username' => '', 'password' => '' },
            'email' => ''
        }
        
        File.open(cfg_path, 'w') { |f| f.write(YAML.dump(cfg)) }
        puts 'Setup your ~/.notifier file and run again.'
        exit 0
    end

    def load_config
      if File.exists? cfg_path
        cfg = YAML.load_file(cfg_path)
      else
        create_config
      end
    end

  end

end

