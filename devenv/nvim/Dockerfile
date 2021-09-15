FROM alpine:edge

RUN apk --no-cache add git neovim bash nodejs npm ripgrep alpine-sdk

WORKDIR /root/.config/nvim
COPY . .

# install packer and plugins. Sleep hack for extra sanity in waiting for packages to install
#RUN nvim --headless -c 'autocmd User PackerComplete sleep 20 | quitall' -c 'silent PackerSync'

# Bootstrap packer https://github.com/wbthomason/packer.nvim#bootstrapping
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


WORKDIR /project

ENTRYPOINT ["/usr/bin/nvim"]
