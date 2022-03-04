function rg \
  --wraps='rg --smart-case --max-columns=200' \
  --description 'alias rg=rg --smart-case --max-columns=200'
  command rg --smart-case --max-columns=200 $argv;
end
