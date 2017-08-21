require "pathname"

task :default => [:dirs, :link, :plugins]

VIM_DIR = Pathname.new(File.join(ENV["HOME"], ".vim"))
CONFIG_DIR = Pathname.new(File.join(ENV["HOME"], ".config"))

desc "Install plugins"
task :plugins do
  sh "vim +PlugInstall +qall"
end

task :link do
  %w(vimrc gvimrc).each do |script|
    target = File.join(ENV['HOME'], ".#{script}")
    safe_link(VIM_DIR.join(script), target)
  end

  safe_link(VIM_DIR, CONFIG_DIR.join("nvim"))
end

task :dirs do
  ["_backup", "_temp", CONFIG_DIR].each do |dir|
    mkdir_p dir
  end
end

def safe_link(source, target)
  if File.exist?(target)
    if File.symlink?(target)
      puts "#{target} already linked, skipping.."
      return
    else
      puts "#{target} exists, backing up and replacing!"
      mv target, "#{target}.#{Time.now.to_i}"
    end
  end

  ln_s source, target
end
