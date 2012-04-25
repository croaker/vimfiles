task :default => [:tmp_dirs, :update, :link, :command_t]

task :update do
  sh "git submodule update --init"
end

desc "Updates all submodules to the latest version"
task :pull_submodules do
  sh "git submodule foreach git pull"
end

task :link do
  %w[vimrc gvimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    
    if File.exist?(dotfile)
      if File.symlink?(dotfile)
        puts "~/.#{script} already linked, skipping.."
        next
      else
        puts "~/.#{script} exists, backing up and replacing!"
        mv dotfile, "#{dotfile}.#{Time.now.to_i}"
      end
    end
      
    ln_s File.join('.vim', script), dotfile
  end
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end

task :command_t do
  puts "Compiling Command-T plugin..."
  Dir.chdir "bundle/command-t/ruby/command-t" do
    # first try to read which ruby version is vim compiled against
    read_version = %{require "rbconfig"; print File.join(RbConfig::CONFIG["bindir"], RbConfig::CONFIG["ruby_install_name"])}
    ruby = `vim --cmd 'ruby #{read_version}' --cmd 'q' 2>&1 >/dev/null | grep -v 'Vim: Warning'`.strip

    # If we don't have a working ruby, detect one
    unless File.executable?(ruby)
      # This tries to prefer custom rubies
      ruby = %w(/usr/local/bin/ruby /usr/bin/ruby /usr/bin/ruby1.8).find {|rb| File.executable? rb } || 'ruby'
    end

    cmd = [ruby, 'extconf.rb']
    sh(*cmd)
    sh "make clean && make"
  end
end
