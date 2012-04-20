task :default => [:tmp_dirs, :update, :link]

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
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end
