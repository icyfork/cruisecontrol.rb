class LatestController < ApplicationController
  def index
    @files = []
    @source = File.join(RAILS_ROOT, "public/latest/")
    all_files = Dir.glob(File.join(@source,"*.*"))
    all_files.each do |f|
      next unless File.file?(f)
      basename = f.sub(@source, "")
      @files << {:name => basename, :mtime => File.stat(f).mtime}
    end
    @files = @files.sort{|a,b| b[:mtime] <=> a[:mtime]}
  end
end
