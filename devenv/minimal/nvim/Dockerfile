FROM alpine:edge

RUN apk --no-cache add git neovim bash nodejs npm ripgrep alpine-sdk

WORKDIR /root/.config/nvim
COPY . .

# install packer and plugins. Sleep hack for extra sanity in waiting for packages to install
RUN nvim --headless -c 'autocmd User PackerComplete sleep 20 | quitall' -c 'silent PackerSync'

# install tree sitters (sleep hack is needed to let vim start up and also finish the async installs)
RUN nvim --headless +"sleep 10" +"silent TSInstall python bash" +"silent LspInstall python" +"silent LspInstall bash" +"sleep 120" +qa

WORKDIR /project

ENTRYPOINT ["/usr/bin/nvim"]
