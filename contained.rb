GIT_DIR = '/home/nils/git_repos/UFOStart'    # Directory of the project's git repository
Dir.chdir(GIT_DIR)
`git log e06e4dc641b9c76e6c32c3c5b79e6918ac5f3a78..change-friends-to-users`.each_line do |line|

  if line.match(/^commit/)
    commit = line.gsub(/^commit /,"")
    puts commit
    contained = false
    `git branch --contains #{commit}`.each_line do |branch|
      if (branch =~ /^\s{2}master$/)
        contained = true
      end
    end
    if contained
      puts 'CONTAINED'
    else
      puts 'NOT CONTAINED'
    end
  end

  if line.match(/^\s{3}/)
    puts line
    puts ''
  end
end
