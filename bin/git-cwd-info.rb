#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# The methods that get called more than once are memoized.
COLOR_WHITE='\033[1;37m'
COLOR_LIGHTGRAY='033[0;37m'
COLOR_GRAY='\033[1;30m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_LIGHTRED='\033[1;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHTGREEN='\033[1;32m'
COLOR_BROWN='\033[0;33m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHTBLUE='\033[1;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_PINK='\033[1;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHTCYAN='\033[1;36m'
COLOR_DEFAULT='\033[0m'

def git_repo_path
  @git_repo_path ||= `git rev-parse --git-dir 2>/dev/null`.strip
end

def in_git_repo
  !git_repo_path.empty? &&
  git_repo_path != '~' &&
  git_repo_path != "#{ENV['HOME']}/.git"
end

def git_parse_branch
  @git_parse_branch ||= File.read("#{git_repo_path}/HEAD").strip.scan(/refs\/heads\/(.*)$/).flatten.first
end

def git_head_commit_id
  `git rev-parse --short HEAD 2>/dev/null`.strip
end

def git_cwd_dirty
  " %{\e[90m%}✗%{\e[0m%}" unless git_repo_path == '.' || `git ls-files -m`.strip.empty?
end

def rebasing_etc
  if File.exists?(File.join(git_repo_path, 'BISECT_LOG'))
    "+bisect"
  elsif File.exists?(File.join(git_repo_path, 'MERGE_HEAD'))
    "+merge"
  elsif %w[rebase rebase-apply rebase-merge ../.dotest].any? {|d| File.exists?(File.join(git_repo_path, d)) }
    "+rebase"
  end
end

if in_git_repo
  print " %{\033[1;31m%}#{git_parse_branch}%{\e[90m%}@%{\e[33m%}#{git_head_commit_id}%{\e[0m%}#{rebasing_etc}#{git_cwd_dirty}"
end