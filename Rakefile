task :default => [:submodules, :tmp_dirs, :link, :bundle]

desc "Install or update all bundled scripts"
task :bundle do
  sh "vim +BundleInstall +qall > /dev/null"
end

task :submodules do
  %w(init update).each { |cmd| sh "git submodule #{cmd}" }
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
