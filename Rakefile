desc 'Generate website HTML'
task :build do
  sh 'bundle exec middleman build'
end

desc 'Upload to production host'
task :upload do
  sh 'rm -rf upload.tmp'
  sh 'mkdir upload.tmp'
  sh 'cp -pR build/* upload.tmp/'
  sh 'cd upload.tmp && git init'
  sh 'echo fullstaqruby.org > upload.tmp/CNAME'
  sh 'cd upload.tmp && git add . && git commit -a -m Build'
  sh 'cd upload.tmp && git remote add origin git@github.com:fullstaq-labs/fullstaq-ruby-website.git'
  sh 'cd upload.tmp && git push -f origin master:gh-pages'
  sh 'rm -rf upload.tmp'
end
