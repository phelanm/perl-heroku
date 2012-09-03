perl-heroku
===========

####  Sun Sep  2 22:12:10 EDT 2012
 ### follow:
  http://blog.kraih.com/mojolicious-in-the-cloud-hello-heroku
  https://github.com/heroku/heroku-buildpack-hello

####  Mon Sep  3 01:24:17 EDT 2012
 ### perl heroku example, push to https://github.com/phelanm/perl-heroku.git
  mjp@uberwald:~/src/heroku/perl-heroku$ git config --global user.name "mark phelan"
  mjp@uberwald:~/src/heroku/perl-heroku$ git config --global user.email phelanm@gmail.com
  mjp@uberwald:~/src/heroku/perl-heroku$ git remote add origin https://github.com/phelanm/perl-heroku.git
     git remote add origin https://github.com/phelanm/perl-heroku.git
  mjp@uberwald:~/src/heroku/perl-heroku$    git push -u origin master
   Username for 'https://github.com': phelanm
   Password for 'https://phelanm@github.com': ***
   Branch master set up to track remote branch master from origin.
   Everything up-to-date
  mjp@uberwald:~/src/heroku/perl-heroku$ git add Makefile.PL Perloku myapp.pl 
  mjp@uberwald:~/src/heroku/perl-heroku$ git add README.md
  mjp@uberwald:~/src/heroku/perl-heroku$ git status
   # On branch master
   # Changes to be committed:
   #   (use "git reset HEAD <file>..." to unstage)
   #
   #	new file:   Makefile.PL
   #	new file:   Perloku
   #	modified:   README.md
   #	new file:   myapp.pl
  mjp@uberwald:~/src/heroku/perl-heroku$    git push -u origin master
   Username for 'https://github.com': phelanm
   Password for 'https://phelanm@github.com': ***
   Branch master set up to track remote branch master from origin.
   Everything up-to-date
  mjp@uberwald:~/src/heroku/perl-heroku$ git init
   Reinitialized existing Git repository in /home/mjp/src/heroku/perl-heroku/.git/
  mjp@uberwald:~/src/heroku/perl-heroku$ git commit -m "Mojolicious::Lite helloworld" .
   [master dabf5d9] Mojolicious::Lite helloworld
    4 files changed, 20 insertions(+), 1 deletion(-)
    create mode 100644 Makefile.PL
    create mode 100755 Perloku
    create mode 100755 myapp.pl
  mjp@uberwald:~/src/heroku/perl-heroku$ git status
   # On branch master
   # Your branch is ahead of 'origin/master' by 1 commit.
   #
   nothing to commit (working directory clean)
  mjp@uberwald:~/src/heroku/perl-heroku$ git push -u origin master
   Username for 'https://github.com': phelanm
   Password for 'https://phelanm@github.com': ***
   
   Counting objects: 8, done.
   Delta compression using up to 2 threads.
   Compressing objects: 100% (6/6), done.
   Writing objects: 100% (6/6), 773 bytes, done.
   Total 6 (delta 0), reused 0 (delta 0)
   To https://github.com/phelanm/perl-heroku.git
      8ac442b..dabf5d9  master -> master
   Branch master set up to track remote branch master from origin.
 
 ### perl heroku example, push to heroku
  ##  follow: https://github.com/judofyr/heroku-buildpack-hello
   #   initial attempt to deploy on heroku
    mjp@uberwald:~/src/heroku/perl-heroku$ heroku create -s cedar --buildpack http://github.com/phelanm/perl-heroku.git
     Creating murmuring-basin-9623... done, stack is cedar
     BUILDPACK_URL=http://github.com/phelanm/perl-heroku.git
     http://murmuring-basin-9623.herokuapp.com/ | git@heroku.com:murmuring-basin-9623.git
     Git remote heroku added
    
    mjp@uberwald:~/src/heroku/perl-heroku$ # vi Perloku Makefile.PL
 
    mjp@uberwald:~/src/heroku/perl-heroku$ git push heroku master
     Counting objects: 9, done.
     Delta compression using up to 2 threads.
     Compressing objects: 100% (7/7), done.
     Writing objects: 100% (9/9), 963 bytes, done.
     Total 9 (delta 0), reused 0 (delta 0)
     
     -----> Heroku receiving push
     -----> Fetching custom buildpack... cloning with git...done
      !     Heroku push rejected, no Cedar-supported app detected
     
     To git@heroku.com:murmuring-basin-9623.git
      ! [remote rejected] master -> master (pre-receive hook declined)
     error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
   #   update files to match heroku-buildpack-hello
    mjp@uberwald:~/src/heroku/perl-heroku$ git status
     # On branch master
     nothing to commit (working directory clean)
   #   setup carton
    mjp@uberwald:~/src/heroku/perl-heroku$ sudo apt-get install carton
     ...
     The following NEW packages will be installed:
       carton cpanminus libcapture-tiny-perl libclass-data-inheritable-perl
       libcpan-distnameinfo-perl libcpan-meta-perl libcpan-meta-requirements-perl
       libcpan-meta-yaml-perl libdevel-stacktrace-perl libexception-class-perl
       libjson-perl libjson-pp-perl liblocal-lib-perl libmodule-cpanfile-perl
       libparse-cpan-meta-perl libtry-tiny-perl
     0 upgraded, 16 newly installed, 0 to remove and 2 not upgraded.
     ...
    mjp@uberwald:~/src/heroku/perl-heroku$ git add carton.lock
     fatal: pathspec 'carton.lock' did not match any files
    mjp@uberwald:~/src/heroku/perl-heroku$ carton
     Installing modules using carton.lock (deployment mode)
     Can't use an undefined value as a HASH reference at /usr/share/perl5/Carton.pm line 78.
    mjp@uberwald:~/src/heroku/perl-heroku$ carton install
     Installing modules using carton.lock (deployment mode)
     Can't use an undefined value as a HASH reference at /usr/share/perl5/Carton.pm line 78.
    mjp@uberwald:~/src/heroku/perl-heroku$ cat cpanfile 
     requires 'Plack', 0.9980;
     requires 'Starman', 0.2000;
    mjp@uberwald:~/src/heroku/perl-heroku$ carton install
     Installing modules using cpanfile
     ! Couldn't find module or a distribution Plack (0.998)
     ! Couldn't find module or a distribution Starman (0.2)
     Installing modules failed
    mjp@uberwald:~/src/heroku/perl-heroku$ sudo apt-get install starman
     ...
     The following NEW packages will be installed:
       libclass-inspector-perl libdata-dump-perl libdevel-stacktrace-ashtml-perl
       libfile-sharedir-perl libfilesys-notify-simple-perl libhash-multivalue-perl
       libhttp-body-perl libhttp-parser-xs-perl libio-multiplex-perl
       libio-socket-inet6-perl libmodule-refresh-perl libnet-cidr-perl
       libnet-server-perl libparams-util-perl libpath-class-perl libplack-perl
       libsocket6-perl libtest-requires-perl libtest-sharedfork-perl
       libtest-tcp-perl libyaml-perl starman
     0 upgraded, 22 newly installed, 0 to remove and 2 not upgraded.
     ...
    mjp@uberwald:~/src/heroku/perl-heroku$ carton install
     Installing modules using cpanfile
     Successfully installed ExtUtils-MakeMaker-6.62 (upgraded from 6.57_05)
     Successfully installed Test-Requires-0.06
     Successfully installed Try-Tiny-0.11
     Successfully installed Hash-MultiValue-0.12
     Successfully installed URI-1.60
     Successfully installed Devel-StackTrace-1.27
     Successfully installed Test-Tester-0.108
     Successfully installed Test-NoWarnings-1.04
     Successfully installed Test-Deep-0.110
     Successfully installed LWP-MediaTypes-6.02
     Successfully installed Encode-Locale-1.03
     Successfully installed HTTP-Date-6.02
     Successfully installed HTML-Tagset-3.20
     Successfully installed HTML-Parser-3.69
     Successfully installed HTTP-Message-6.03
     Successfully installed HTTP-Body-1.15
     Successfully installed Test-SharedFork-0.20
     Successfully installed Test-TCP-1.17
     Successfully installed Class-Inspector-1.27
     Successfully installed File-ShareDir-1.03
     Successfully installed Filesys-Notify-Simple-0.08
     Successfully installed HTTP-Negotiate-6.01
     Successfully installed File-Listing-6.04
     Successfully installed HTTP-Daemon-6.01
     Successfully installed Net-HTTP-6.03
     Successfully installed HTTP-Cookies-6.01
     Successfully installed WWW-RobotRules-6.02
     Successfully installed libwww-perl-6.04
     Successfully installed Devel-StackTrace-AsHTML-0.11
     Successfully installed Plack-1.0003
     Successfully installed Net-Server-2.006
     Successfully installed HTTP-Parser-XS-0.14
     Successfully installed Data-Dump-1.21
     Successfully installed Starman-0.3001
     34 distributions installed
     Complete! Modules were installed into local
    mjp@uberwald:~/src/heroku/perl-heroku$ git add cpanfile carton.lock
    mjp@uberwald:~/src/heroku/perl-heroku$ git commit -m "add Plack and Starman"
     [detached HEAD ec561a9] add Plack and Starman
      2 files changed, 3150 insertions(+)
      create mode 100644 carton.lock
      create mode 100644 cpanfile
    mjp@uberwald:~/src/heroku/perl-heroku$ carton exec -Ilib -- starman -p 8080 myapp.psgi
     2012/09/02-23:10:02 Starman::Server (type Net::Server::PreFork) starting! pid(22754)
     Resolved [*]:8080 to [0.0.0.0]:8080, IPv4
     Binding to TCP port 8080 on host 0.0.0.0 with IPv4
     Setting gid to "1000 1000 20 24 25 29 30 44 46 100 102 104 109 1000"
     Error while loading myapp.psgi: No such file or directory at (eval 19) line 4.
    mjp@uberwald:~/src/heroku/perl-heroku$ carton exec -Ilib -- starman -p 8080 myapp.pl 
     2012/09/02-23:10:20 Starman::Server (type Net::Server::PreFork) starting! pid(23692)
     Resolved [*]:8080 to [0.0.0.0]:8080, IPv4
     Binding to TCP port 8080 on host 0.0.0.0 with IPv4
     Setting gid to "1000 1000 20 24 25 29 30 44 46 100 102 104 109 1000"
     Error while loading myapp.pl: Can't locate Mojolicious/Lite.pm in @INC (@INC contains: lib local/lib/perl5/x86_64-linux-gnu-thread-multi local/lib/perl5 . /usr/share/perl/5.14 /usr/lib/perl/5.14) at myapp.pl line 2.
    mjp@uberwald:~/src/heroku/perl-heroku$ sudo apt-get install libmojolicious-perl libmojolicious-plugin-basicauth-perl libtest-www-mechanize-mojo-perl
     ...
     The following NEW packages will be installed:
       libcarp-assert-more-perl libcarp-assert-perl libhtml-form-perl
       libhttp-daemon-perl libhttp-server-simple-perl libjs-jquery
       libmojolicious-perl libmojolicious-plugin-basicauth-perl
       libtest-longstring-perl libtest-www-mechanize-mojo-perl
       libtest-www-mechanize-perl libwww-mechanize-perl
     0 upgraded, 12 newly installed, 0 to remove and 2 not upgraded.
     ...
    mjp@uberwald:~/src/heroku/perl-heroku$ carton exec -Ilib -- starman -p 8080 myapp.pl 
     2012/09/02-23:15:14 Starman::Server (type Net::Server::PreFork) starting! pid(27141)
     Resolved [*]:8080 to [0.0.0.0]:8080, IPv4
     Binding to TCP port 8080 on host 0.0.0.0 with IPv4
     Setting gid to "1000 1000 20 24 25 29 30 44 46 100 102 104 109 1000"
     Error while loading myapp.pl: Can't locate Mojolicious/Lite.pm in @INC (@INC contains: lib local/lib/perl5/x86_64-linux-gnu-thread-multi local/lib/perl5 . /usr/share/perl/5.14 /usr/lib/perl/5.14) at myapp.pl line 2.
     ...
    mjp@uberwald:~/src/heroku/perl-heroku$ sudo updatedb
    mjp@uberwald:~/src/heroku/perl-heroku$ locate Lite.pm
     /usr/lib/perl5/DBD/SQLite.pm
     /usr/share/perl/5.14.2/CPANPLUS/Internals/Source/SQLite.pm
     /usr/share/perl5/Mojolicious/Lite.pm
    mjp@uberwald:~/src/heroku/perl-heroku$ carton install
     Installing modules using cpanfile
     You have Plack (1.0003)
     You have Starman (0.3001)
     Complete! Modules were installed into local
    cat /usr/share/perl5/Mojolicious.pm
     ...
     our $VERSION  = '2.98';
     ...
    vi ~/src/heroku/perl-heroku/cpanfile
     requires 'Plack', 0.9980;
     requires 'Starman', 0.2000;
     requires 'Mojolicious', 2.98;
    mjp@uberwald:~/src/heroku/perl-heroku$ carton install
     Installing modules using cpanfile
     You have Plack (1.0003)
     You have Starman (0.3001)
     Successfully installed Mojolicious-3.36
     1 distribution installed
     Complete! Modules were installed into local
    man carton
     ...
              # On your development environment
              > cat cpanfile
              requires 'Plack', 0.9980;
              requires 'Starman', 0.2000;
     
              > carton install
              > git add cpanfile carton.lock
              > git commit -m "add Plack and Starman"
     
              # Other developer's machine, or on a deployment box
              > carton install
              > carton exec -Ilib -- starman -p 8080 myapp.psgi
     ...
    mjp@uberwald:~/src/heroku/perl-heroku$ carton exec -Ilib -- starman -p 8080 myapp.pl 
     2012/09/02-23:26:00 Starman::Server (type Net::Server::PreFork) starting! pid(29849)
     Resolved [*]:8080 to [0.0.0.0]:8080, IPv4
     Binding to TCP port 8080 on host 0.0.0.0 with IPv4
     Setting gid to "1000 1000 20 24 25 29 30 44 46 100 102 104 109 1000"
     ...
    
      mjp@uberwald:~/notes$ curl "http://localhost:8080"
       Hello phelanm Mojo!
    
     ...
     [Sun Sep  2 23:27:04 2012] [debug] Your secret passphrase needs to be changed!!!
     [Sun Sep  2 23:27:04 2012] [debug] GET / (curl/7.27.0).
     [Sun Sep  2 23:27:04 2012] [debug] 200 OK (0.012039s, 83.063/s).
     ...
   #   push to heroku..
    mjp@uberwald:~/src/heroku/perl-heroku$ git status
     # Not currently on any branch.
     # Changes not staged for commit:
     #   (use "git add <file>..." to update what will be committed)
     #   (use "git checkout -- <file>..." to discard changes in working directory)
     #
     #	modified:   Makefile.PL
     #	modified:   Perloku
     #	modified:   carton.lock
     #	modified:   cpanfile
    
    mjp@uberwald:~/src/heroku/perl-heroku$ cat Procfile
     web: ./myapp.pl daemon --listen http://*:$PORT
    
    mjp@uberwald:~/src/heroku/perl-heroku$ git add Procfile
    mjp@uberwald:~/src/heroku/perl-heroku$ git status
     # Not currently on any branch.
     # Changes to be committed:
     #   (use "git reset HEAD <file>..." to unstage)
     #
     #	new file:   Procfile
     #
     # Changes not staged for commit:
     #   (use "git add <file>..." to update what will be committed)
     #   (use "git checkout -- <file>..." to discard changes in working directory)
     #
     #	modified:   Makefile.PL
     #	modified:   Perloku
     #	modified:   carton.lock
     #	modified:   cpanfile
    mjp@uberwald:~/src/heroku/perl-heroku$ git checkout master
     error: Your local changes to the following files would be overwritten by checkout:
     	carton.lock
     	cpanfile
     Please, commit your changes or stash them before you can switch branches.
     Aborting
    mjp@uberwald:~/src/heroku/perl-heroku$ git commit -m "setup carton" .
     [detached HEAD 978f428] setup carton
      5 files changed, 396 insertions(+), 4 deletions(-)
      create mode 100644 Procfile
    mjp@uberwald:~/src/heroku/perl-heroku$ git status
     # Not currently on any branch.
     # Untracked files:
     #   (use "git add <file>..." to include in what will be committed)
     #
     #	.carton/
     #	Makefile.PL~
     #	Perloku~
     #	Procfile~
     #	cpanfile~
     #	local/
     nothing added to commit but untracked files present (use "git add" to track)
    mjp@uberwald:~/src/heroku/perl-heroku$ git checkout master
     Warning: you are leaving 2 commits behind, not connected to
     any of your branches:
     
       978f428 setup carton
       ec561a9 add Plack and Starman
     
     If you want to keep them by creating a new branch, this may be a good time
     to do so with:
     
      git branch new_branch_name 978f4287d7f30509f76ea27bf2ef07494ddf84c7
     
     Switched to branch 'master'
    mjp@uberwald:~/src/heroku/perl-heroku$ git branch heroku_deps 978f4287d7f30509f76ea27bf2ef07494ddf84c7
    mjp@uberwald:~/src/heroku/perl-heroku$ git checkout heroku_deps
     Switched to branch 'heroku_deps'
    mjp@uberwald:~/src/heroku/perl-heroku$ git checkout master
     Switched to branch 'master'
    mjp@uberwald:~/src/heroku/perl-heroku$ ls cpanfile
     ls: cannot access cpanfile: No such file or directory
    mjp@uberwald:~/src/heroku/perl-heroku$ git status
     # On branch master
     ...
     nothing added to commit but untracked files present (use "git add" to track)
    mjp@uberwald:~/src/heroku/perl-heroku$ git merge heroku_deps
     Updating dabf5d9..978f428
     Fast-forward
      Makefile.PL |   11 +-
      Perloku     |   24 +-
      Procfile    |    1 +
      carton.lock | 3511 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      cpanfile    |    3 +
      5 files changed, 3546 insertions(+), 4 deletions(-)
      create mode 100644 Procfile
      create mode 100644 carton.lock
      create mode 100644 cpanfile
    mjp@uberwald:~/src/heroku/perl-heroku$ ls cpanfile
     cpanfile
    # push to github first
    mjp@uberwald:~/src/heroku/perl-heroku$ git push -u origin master
     Username for 'https://github.com': phelanm
     Password for 'https://phelanm@github.com': ***
     
     Counting objects: 14, done.
     Delta compression using up to 2 threads.
     Compressing objects: 100% (10/10), done.
     Writing objects: 100% (11/11), 12.32 KiB, done.
     Total 11 (delta 2), reused 0 (delta 0)
     To https://github.com/phelanm/perl-heroku.git
        dabf5d9..978f428  master -> master
     Branch master set up to track remote branch master from origin.
    # now heroku
    mjp@uberwald:~/src/heroku/perl-heroku$ git push heroku master
     Counting objects: 20, done.
     Delta compression using up to 2 threads.
     Compressing objects: 100% (17/17), done.
     Writing objects: 100% (20/20), 13.10 KiB, done.
     Total 20 (delta 3), reused 0 (delta 0)
     
     -----> Heroku receiving push
     -----> Fetching custom buildpack... cloning with git...done
      !     Heroku push rejected, no Cedar-supported app detected
     
     To git@heroku.com:murmuring-basin-9623.git
      ! [remote rejected] master -> master (pre-receive hook declined)
     error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
    # alter Perloku and myapp.pl
     #originally:
      cat Perloku
       #!/usr/bin/env perl
       use Mojolicious::Lite;
       
       get '/' => sub {
         my $self = shift;
         $self->render('index');
       };
       
       app->start;
       __DATA__
       
       @@ index.html.ep
       % layout 'default';
       % title 'Welcome';
       Welcome to the Mojolicious real-time web framework!
       
       @@ layouts/default.html.ep
       <!DOCTYPE html>
       <html>
         <head><title><%= title %></title></head>
         <body><%= content %></body>
       </html>
      
      
      cat ~/src/heroku/perl-heroku/myapp.pl
       #!/usr/bin/env perl
       use Mojolicious::Lite;
       
       get '/' => {text => 'Hello phelanm Mojo!'};
       
       app->start;
     #changed version:
      cat ~/src/heroku/perl-heroku/Perloku
       #!/bin/sh
       ./myapp.pl daemon -l http://*:$PORT -m production
      cat ~/src/heroku/perl-heroku/myapp.pl
       #!/usr/bin/env perl
       use Mojolicious::Lite;
       
       get '/' => sub {
         my $self = shift;
         $self->render('index');
       };
       
       app->start;
       __DATA__
       
       @@ index.html.ep
       % layout 'default';
       % title 'Welcome';
       Welcome to the Mojolicious real-time web framework!
       
       @@ layouts/default.html.ep
       <!DOCTYPE html>
       <html>
         <head><title><%= title %></title></head>
         <body><%= content %></body>
       </html>
    # run locally
     mjp@uberwald:~/src/heroku/perl-heroku$ carton install
      Installing modules using cpanfile
      You have Plack (1.0003)
      You have Starman (0.3001)
      You have Mojolicious (3.36)
      Complete! Modules were installed into local
     
     mjp@uberwald:~/src/heroku/perl-heroku$ carton exec -Ilib -- starman -p 8080 myapp.pl 
      2012/09/03-00:13:06 Starman::Server (type Net::Server::PreFork) starting! pid(7386)
      Resolved [*]:8080 to [0.0.0.0]:8080, IPv4
      Binding to TCP port 8080 on host 0.0.0.0 with IPv4
      Setting gid to "1000 1000 20 24 25 29 30 44 46 100 102 104 109 1000"
      ...
     
      mjp@uberwald:~/notes$ curl "http://localhost:8080"
       <!DOCTYPE html>
       <html>
         <head><title>mphelan Welcome</title></head>
         <body>Welcome to the Mojolicious real-time web framework!
       </body>
       </html>
     
      ...
      [Mon Sep  3 00:13:15 2012] [debug] Your secret passphrase needs to be changed!!!
      [Mon Sep  3 00:13:15 2012] [debug] GET / (curl/7.27.0).
      [Mon Sep  3 00:13:15 2012] [debug] Routing to a callback.
      [Mon Sep  3 00:13:15 2012] [debug] Rendering template "index.html.ep" from DATA section.
      [Mon Sep  3 00:13:15 2012] [debug] Rendering template "layouts/default.html.ep" from DATA section.
      [Mon Sep  3 00:13:15 2012] [debug] 200 OK (0.007699s, 129.887/s).
      ...
 
    # checkin to github
     mjp@uberwald:~/src/heroku/perl-heroku$ git add Perloku myapp.pl
     mjp@uberwald:~/src/heroku/perl-heroku$ git status
      # On branch master
      # Changes to be committed:
      #   (use "git reset HEAD <file>..." to unstage)
      #
      #	modified:   Perloku
      #	modified:   myapp.pl
     mjp@uberwald:~/src/heroku/perl-heroku$ git commit -m "alter to work with heroku" .
      [master 17ce71b] alter to work with heroku
       2 files changed, 19 insertions(+), 23 deletions(-)
     mjp@uberwald:~/src/heroku/perl-heroku$ git push -u origin master
      Username for 'https://github.com': phelanm
      Password for 'https://phelanm@github.com': ***
      
      Counting objects: 7, done.
      Delta compression using up to 2 threads.
      Compressing objects: 100% (4/4), done.
      Writing objects: 100% (4/4), 393 bytes, done.
      Total 4 (delta 2), reused 0 (delta 0)
      To https://github.com/phelanm/perl-heroku.git
         978f428..17ce71b  master -> master
      Branch master set up to track remote branch master from origin.
    # try to push to heroku
     mjp@uberwald:~/src/heroku/perl-heroku$ git push heroku master
      Counting objects: 23, done.
      Delta compression using up to 2 threads.
      Compressing objects: 100% (20/20), done.
      Writing objects: 100% (23/23), 13.35 KiB, done.
      Total 23 (delta 5), reused 0 (delta 0)
      
      -----> Heroku receiving push
      -----> Fetching custom buildpack... cloning with git...done
       !     Heroku push rejected, no Cedar-supported app detected
      
      To git@heroku.com:murmuring-basin-9623.git
       ! [remote rejected] master -> master (pre-receive hook declined)
      error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
     mjp@uberwald:~/src/heroku/perl-heroku$ heroku create -s cedar --buildpack http://github.com/phelanm/perl-heroku.git
      Creating quiet-woodland-8393... done, stack is cedar
      BUILDPACK_URL=http://github.com/phelanm/perl-heroku.git
      http://quiet-woodland-8393.herokuapp.com/ | git@heroku.com:quiet-woodland-8393.git
     mjp@uberwald:~/src/heroku/perl-heroku$ curl "http://quiet-woodland-8393.herokuapp.com/"
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
          <html>
          <head>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
              <title>Heroku | Welcome to your new app!</title>
      ...
     mjp@uberwald:~/src/heroku/perl-heroku$ git push heroku master
      Counting objects: 23, done.
      Delta compression using up to 2 threads.
      Compressing objects: 100% (20/20), done.
      Writing objects: 100% (23/23), 13.35 KiB, done.
      Total 23 (delta 5), reused 0 (delta 0)
      
      -----> Heroku receiving push
      -----> Fetching custom buildpack... cloning with git...done
       !     Heroku push rejected, no Cedar-supported app detected
      
      To git@heroku.com:murmuring-basin-9623.git
       ! [remote rejected] master -> master (pre-receive hook declined)
      error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
     # update ~/src/heroku/perl-heroku/Makefile.PL
       NAME         => 'myapp.pl',
       AUTHOR       => 'mark phelan <phelanm@gmail.com>',
       EXE_FILES    => ['myapp.pl'],
      git status
      git add Makefile.PL
      git commit -m "alter for heroku again" .
     # push to github
      mjp@uberwald:~/src/heroku/perl-heroku$ git push -u origin master
       Username for 'https://github.com': phelanm
       Password for 'https://phelanm@github.com': ***
       Counting objects: 5, done.
       Delta compression using up to 2 threads.
       Compressing objects: 100% (3/3), done.
       Writing objects: 100% (3/3), 332 bytes, done.
       Total 3 (delta 2), reused 0 (delta 0)
       To https://github.com/phelanm/perl-heroku.git
          17ce71b..b359dfb  master -> master
       Branch master set up to track remote branch master from origin.
     # try to push to heroku
      mjp@uberwald:~/src/heroku/perl-heroku$ git push heroku master
       Counting objects: 26, done.
       Delta compression using up to 2 threads.
       Compressing objects: 100% (23/23), done.
       Writing objects: 100% (26/26), 13.61 KiB, done.
       Total 26 (delta 7), reused 0 (delta 0)
       
       -----> Heroku receiving push
       -----> Fetching custom buildpack... cloning with git...done
        !     Heroku push rejected, no Cedar-supported app detected
       
       To git@heroku.com:murmuring-basin-9623.git
        ! [remote rejected] master -> master (pre-receive hook declined)
       error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
      mjp@uberwald:~/src/heroku/perl-heroku$ heroku create -s cedar --buildpack http://github.com/phelanm/perl-heroku.git
       Creating calm-brushlands-2877... done, stack is cedar
       BUILDPACK_URL=http://github.com/phelanm/perl-heroku.git
       http://calm-brushlands-2877.herokuapp.com/ | git@heroku.com:calm-brushlands-2877.git
      
      mjp@uberwald:~/src/heroku/perl-heroku$ heroku create -s cedar --buildpack http://github.com/phelanm/perl-heroku.git
       Creating calm-brushlands-2877... done, stack is cedar
       BUILDPACK_URL=http://github.com/phelanm/perl-heroku.git
       http://calm-brushlands-2877.herokuapp.com/ | git@heroku.com:calm-brushlands-2877.git
      mjp@uberwald:~/src/heroku/perl-heroku$  git push heroku master
       Counting objects: 26, done.
       Delta compression using up to 2 threads.
       Compressing objects: 100% (23/23), done.
       Writing objects: 100% (26/26), 13.61 KiB, done.
       Total 26 (delta 7), reused 0 (delta 0)
       
       -----> Heroku receiving push
       -----> Fetching custom buildpack... cloning with git...done
        !     Heroku push rejected, no Cedar-supported app detected
       
       To git@heroku.com:murmuring-basin-9623.git
        ! [remote rejected] master -> master (pre-receive hook declined)
       error: failed to push some refs to 'git@heroku.com:murmuring-basin-9623.git'
     
     # try to rip off working one..
      mjp@uberwald:~/src/heroku$ git clone  http://github.com/judofyr/perloku.git
     
      mjp@uberwald:~/src/heroku/perl-heroku$ cp -R ../perloku/support/ .
      mjp@uberwald:~/src/heroku/perl-heroku$ cp -R ../perloku/bin/ .
      mjp@uberwald:~/src/heroku/perl-heroku$ git add bin support
      mjp@uberwald:~/src/heroku/perl-heroku$ git commit -m "add bin/ support/ from perloku" .
       [master 6037dbd] add bin/ support/ from perloku
        4 files changed, 83 insertions(+)
        create mode 100755 bin/compile
        create mode 100755 bin/detect
        create mode 100755 bin/release
        create mode 100755 support/build_perl
      mjp@uberwald:~/src/heroku/perl-heroku$ git push -u origin master
       Username for 'https://github.com': phelanm
       Password for 'https://phelanm@github.com': ***
       
       Counting objects: 9, done.
       Delta compression using up to 2 threads.
       Compressing objects: 100% (7/7), done.
       Writing objects: 100% (8/8), 1.44 KiB, done.
       Total 8 (delta 1), reused 0 (delta 0)
       To https://github.com/phelanm/perl-heroku.git
          b359dfb..6037dbd  master -> master
       Branch master set up to track remote branch master from origin.
      mjp@uberwald:~/src/heroku/perl-heroku$   git push heroku master
       Counting objects: 34, done.
       Delta compression using up to 2 threads.
       Compressing objects: 100% (30/30), done.
       Writing objects: 100% (34/34), 15.00 KiB, done.
       Total 34 (delta 8), reused 0 (delta 0)
       
       -----> Heroku receiving push
       -----> Fetching custom buildpack... cloning with git...done
       -----> Perloku app detected
       -----> Vendoring Perl
              Using Perl 5.14.2
       -----> Installing dependencies
              --> Working on /tmp/build_3ta69zgbeo8w0
              Configuring /tmp/build_3ta69zgbeo8w0 ... OK
              ==> Found dependencies: Mojolicious
              --> Working on Mojolicious
              Fetching http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Mojolicious-3.36.tar.gz ... OK
              Configuring Mojolicious-3.36 ... OK
              Building Mojolicious-3.36 ... OK
              Successfully installed Mojolicious-3.36
              <== Installed dependencies for /tmp/build_3ta69zgbeo8w0. Finishing.
              1 distribution installed
              Dependencies installed
       -----> Discovering process types
              Procfile declares types -> web
       -----> Compiled slug size is 12.4MB
       -----> Launching... done, v4
              http://murmuring-basin-9623.herokuapp.com deployed to Heroku
       
       To git@heroku.com:murmuring-basin-9623.git
        * [new branch]      master -> master
      mjp@uberwald:~/src/heroku/perl-heroku$ curl "http://murmuring-basin-9623.herokuapp.com"
       <!DOCTYPE html>
       <html>
         <head><title>mphelan Welcome</title></head>
         <body>Welcome to the Mojolicious real-time web framework!
       </body>
       </html>
 