function lodocker --wraps='docker compose logs -f' --description 'alias lodocker docker compose logs -f'
  docker compose logs -f $argv
        
end
